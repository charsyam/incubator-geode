/*=========================================================================
 * Copyright (c) 2010-2014 Pivotal Software, Inc. All Rights Reserved.
 * This product is protected by U.S. and international copyright
 * and intellectual property laws. Pivotal products are covered by
 * one or more patents listed at http://www.pivotal.io/patents.
 *=========================================================================
 */
package com.gemstone.gemfire.modules.session.internal.filter.attributes;

import com.gemstone.gemfire.DataSerializable;
import com.gemstone.gemfire.Instantiator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This class implements immediately transmitted attributes. All attributes are
 * transmitted for every attribute update. This is bound to be a performance hit
 * in some cases but ensures much higher data availability.
 */
public class ImmediateSessionAttributes extends AbstractSessionAttributes {

  private static final Logger LOG =
      LoggerFactory.getLogger(ImmediateSessionAttributes.class.getName());

  /**
   * Register ourselves for de-serialization
   */
  static {
    Instantiator.register(
        new Instantiator(ImmediateSessionAttributes.class, 347) {
          @Override
          public DataSerializable newInstance() {
            return new ImmediateSessionAttributes();
          }
        });
  }

  /**
   * Default constructor
   */
  public ImmediateSessionAttributes() {
  }

  @Override
  public Object putAttribute(String attr, Object value) {
    Object obj = attributes.put(attr, value);
    flush();
    return obj;
  }

  @Override
  public Object removeAttribute(String attr) {
    Object obj = attributes.remove(attr);
    flush();
    return obj;
  }
}