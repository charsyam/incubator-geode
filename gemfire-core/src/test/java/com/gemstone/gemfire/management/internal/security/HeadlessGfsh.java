package com.gemstone.gemfire.management.internal.security;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;

import jline.ConsoleReader;

import org.springframework.shell.core.ExitShellRequest;
import org.springframework.shell.event.ShellStatus.Status;

import com.gemstone.gemfire.management.internal.cli.CliUtil;
import com.gemstone.gemfire.management.internal.cli.shell.Gfsh;
import com.gemstone.gemfire.management.internal.cli.shell.GfshConfig;
import com.gemstone.gemfire.management.internal.cli.shell.jline.GfshUnsupportedTerminal;


/**
 * This is headless shell which can be used to submit random commands and get command-result 
 * It is used for commands testing but can be used as for anything like programmatically
 * sending commands to operate on GemFire Distributed systems.
 * TODO : Merge HeadlessGfsh and HeadlessGfshShell
 * TODO : Provide constructor for optionally specifying GfshConfig to provide logDirectory and logLevel
 *  
 * @author tushark
 *
 */
@SuppressWarnings("rawtypes")
public class HeadlessGfsh  implements ResultHandler {
  
  public static final String ERROR_RESULT = "_$_ERROR_RESULT";

  private HeadlessGfshShell shell = null;  
  private LinkedBlockingQueue queue = new LinkedBlockingQueue<>();
  private long timeout = 20;
  public String outputString=null;
  
  public HeadlessGfsh(String name, int timeout) throws ClassNotFoundException, IOException {
    this.timeout = timeout;
    System.setProperty("jline.terminal", GfshUnsupportedTerminal.class.getName());    
    this.shell = new HeadlessGfshShell(name, this);
    this.shell.start();
  }
  
  public void setThreadLocalInstance(){
    shell.setThreadLocalInstance();
  }
  
  //TODO : Have non-blocking method also where we move executeCommand call to separate thread-pool
  public boolean executeCommand(String command) {
    boolean status = false;
    try {
      outputString = null;
      status = shell.executeCommand(command);
    } catch (Exception e) {
      outputString = e.getMessage();
    }
    return status;
  }
  
  int getCommandExecutionStatus(){
    return shell.getCommandExecutionStatus();
  }
  
  @SuppressWarnings("unchecked")
  @Override
  public void handleExecutionResult(Object result, String sysout) {    
    queue.add(result);
    outputString = sysout;
  }
  
  public Object getResult() throws InterruptedException {
    Object result = queue.poll(timeout, TimeUnit.SECONDS);
    queue.clear();
    return result;
  }
  
  public void clear(){
    queue.clear();
    outputString = null;
  }
  
  public void terminate() {    
    shell.terminate();
  }
  
  public boolean isConnectedAndReady() {
    return shell.isConnectedAndReady();
  }
  
  public String getErrorString() {
    return shell.errorString;
  }

  public boolean hasError() {
    return shell.hasError();
  }   
  
  public static class HeadlessGfshShell extends Gfsh {

    private ResultHandler handler = null;
    private final Lock lock = new ReentrantLock();
    private final Condition endOfShell = lock.newCondition();
    private ByteArrayOutputStream output = null;
    private String errorString = null;
    private boolean hasError = false;

    protected HeadlessGfshShell(String testName, ResultHandler handler) throws ClassNotFoundException, IOException {
      super(false, new String[] {}, new HeadlessGfshConfig(testName));
      this.handler = handler;
    }

    public void setThreadLocalInstance() {
      gfshThreadLocal.set(this);      
    }

    protected void handleExecutionResult(Object result) {
      if(!result.equals(ERROR_RESULT)) {
        super.handleExecutionResult(result);
        handler.handleExecutionResult(result, output.toString());
        output.reset();
      } else {
        //signal waiting queue with error condition with empty output
        output.reset();
        handler.handleExecutionResult(result, output.toString());        
      }
    }      

    int getCommandExecutionStatus() {
      return getLastExecutionStatus();
    }

    public void terminate() {
      closeShell();
      stopPromptLoop();
      stop();
    }
    
    private void stopPromptLoop() {
      lock.lock();
      try {
        endOfShell.signalAll();
      } finally {
        lock.unlock();
      }      
    }
    
    public String getErrorString() {
      return errorString;
    }

    public boolean hasError() {
      return hasError;
    }

    /**
     * We override this method just to fool runner thread in reading from nothing. It waits for Condition endOfShell
     * which is signalled when terminate is called. This achieves clean shutdown of runner thread. 
     */
    @Override
    public void promptLoop() {
      lock.lock();
      try {
        while (true) {
          try {
            endOfShell.await();
          } catch (InterruptedException e) {
            //e.printStackTrace();
          }
          this.exitShellRequest = ExitShellRequest.NORMAL_EXIT;
          setShellStatus(Status.SHUTTING_DOWN);
          break;
        }
      } finally {
        lock.unlock();
      }
    }

    private static void setGfshOutErr(PrintStream outToUse) {
      Gfsh.gfshout = outToUse;
      Gfsh.gfsherr = outToUse;
    }
    
    /**
     * This prints out error messages when Exceptions occur in shell. Capture it
     * and set error flag=true and send ERROR_RESULT on the queue to signal thread
     * waiting for CommandResult
     */
    @Override
    public void logWarning(String message, Throwable t) {
      super.logWarning(message, t);
      errorString = message;
      hasError = true;
      //signal waiting queue with error condition
      handleExecutionResult(ERROR_RESULT);
    }

    /**
     * This prints out error messages when Exceptions occur in shell. Capture it
     * and set error flag=true and send ERROR_RESULT on the queue to signal thread
     * waiting for CommandResult
     */
    @Override
    public void logSevere(String message, Throwable t) {
      super.logSevere(message, t);
      errorString = message;
      hasError = true;
      //signal waiting queue with error condition
      handleExecutionResult(ERROR_RESULT);
    }
    
    /**
     * Setup console-reader to capture Shell output
     */
    @Override
    protected ConsoleReader createConsoleReader() {
      try {        
        output = new ByteArrayOutputStream(1024 * 10);
        PrintStream sysout = new PrintStream(output);
        Writer wrappedOut = new BufferedWriter(new OutputStreamWriter(sysout));
        setGfshOutErr(sysout);
        return new ConsoleReader(new FileInputStream(FileDescriptor.in),new PrintWriter(wrappedOut));
      } catch (IOException e) {        
        throw new RuntimeException(e);
      }
    }
  }
  
  
  /**
   * HeadlessGfshConfig for tests. Taken from TestableGfsh
   */
  static class HeadlessGfshConfig extends GfshConfig {
    {
      // set vm as a gfsh vm
      CliUtil.isGfshVM = true;
    }

    private File   parentDir;
    private String fileNamePrefix;
    private String name;
    private String generatedHistoryFileName = null;

    public HeadlessGfshConfig(String name) {
      this.name = name;

      if (isDUnitTest(this.name)) {
        fileNamePrefix = this.name;
      } else {        
        fileNamePrefix = "non-hydra-client";
      }

      parentDir = new File("gfsh_files");
      parentDir.mkdirs();
    }

    private static boolean isDUnitTest(String name) {
      boolean isDUnitTest = false;
      if (name != null) {
        String[] split = name.split("_");
        if (split.length != 0 && split[0].endsWith("DUnitTest")) {
          isDUnitTest = true;
        }
      }
      return isDUnitTest;
    }

    @Override
    public String getLogFilePath() {
      return new File(parentDir, getFileNamePrefix() + "-gfsh.log").getAbsolutePath();
    }

    private String getFileNamePrefix() {
      String timeStamp = new java.sql.Time(System.currentTimeMillis()).toString();
      timeStamp = timeStamp.replace(':', '_');
      return fileNamePrefix + "-" + timeStamp;
    }

    @Override
    public String getHistoryFileName() {
      if(generatedHistoryFileName == null) {
        String fileName = new File(parentDir, (getFileNamePrefix() +"-gfsh.history")).getAbsolutePath();
        generatedHistoryFileName = fileName;
        return fileName;
      } else {
        return generatedHistoryFileName;
      }
    }

    @Override
    public boolean isTestConfig() {
      return true;
    }

    @Override
    public Level getLogLevel() {
      // Keep log level fine for tests
      return Level.FINE;
    }
  }
  
}