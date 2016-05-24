#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/cache30/CachedAllEventsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/ClientAuthenticationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/ClientAuthenticationPart2DUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/ClientAuthorizationDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/ClientAuthorizationTwoDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/ClientAuthzObjectModDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ClientCommandsDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/ClientCQPostAuthorizationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/ClientMultiUserAuthzDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/ClientPostAuthorizationDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/management/internal/configuration/ClusterConfigurationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ConfigCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/CreateAlterDestroyRegionCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/DeltaClientAuthorizationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/DeltaClientPostAuthorizationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/DeployCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/DiskStoreCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/distributed/DistributedMemberDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/DistributedSystemDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/distributed/DistributedSystemDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/disttx/DistTXDebugDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/disttx/DistTXPersistentDebugDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/DurableClientCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/FunctionCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServiceLocalPRDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServiceLocalRRDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServiceMultipleOnMemberDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServicePeerAccessorPRDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServicePeerAccessorRRDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/execute/FunctionServiceSingleOnMemberDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/GemfireDataCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/GetCommandOnRegionWithCacheLoaderDuringCacheMissDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/internal/cache/ha/HADispatcherDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/distributed/HostedLocatorsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/IndexCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/test/dunit/tests/JUnit4BasicDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/test/dunit/tests/JUnit4GetDefaultDiskStoreNameDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/test/dunit/tests/JUnit4GetTestMethodNameDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/test/dunit/tests/JUnit4OverridingGetPropertiesDisconnectsAllDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/test/dunit/tests/JUnit4VMDUnitTest.java
git checkout -- ./geode-assembly/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/LauncherLifecycleCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ListAndDescribeDiskStoreCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ListAndDescribeRegionDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ListIndexCommandDUnitTest.java
git checkout -- ./geode-lucene/src/test/java/com/gemstone/gemfire/cache/lucene/LuceneQueriesPeerPRDUnitTest.java
git checkout -- ./geode-lucene/src/test/java/com/gemstone/gemfire/cache/lucene/LuceneQueriesPeerPROverflowDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MemberCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MiscellaneousCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MiscellaneousCommandsExportLogsPart1DUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MiscellaneousCommandsExportLogsPart2DUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MiscellaneousCommandsExportLogsPart3DUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/MiscellaneousCommandsExportLogsPart4DUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/MultiUserAPIDUnitTest.java
git checkout -- ./geode-cq/src/test/java/com/gemstone/gemfire/security/MultiUserDurableCQAuthzDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/security/P2PAuthenticationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/QueueCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/cache/query/dunit/SelectStarQueryDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/SharedConfigurationCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/configuration/SharedConfigurationDUnitTest.java
git checkout -- ./geode-assembly/src/test/java/com/gemstone/gemfire/management/internal/configuration/SharedConfigurationEndToEndDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/configuration/SharedConfigurationUsingDirDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ShellCommandsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ShowDeadlockDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ShowMetricsDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/ShowStackTraceDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/tier/sockets/UpdatePropagationDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/internal/cache/tier/sockets/UpdatePropagationPRDUnitTest.java
git checkout -- ./geode-core/src/test/java/com/gemstone/gemfire/management/internal/cli/commands/UserCommandsDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandCreateGatewayReceiverDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandCreateGatewaySenderDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandGatewayReceiverStartDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandGatewayReceiverStopDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandGatewaySenderStartDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandGatewaySenderStopDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandListDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandPauseResumeDUnitTest.java
git checkout -- ./geode-wan/src/test/java/com/gemstone/gemfire/internal/cache/wan/wancommand/WanCommandStatusDUnitTest.java

#Kirks changes
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/TestDataSerializer.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/ConnectionPoolAutoDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/ConnectionPoolDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/management/MemoryThresholdsDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/management/MemoryThresholdsOffHeapDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/query/QueryJUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/query/dunit/ResourceManagerWithQueryMonitorDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache/query/internal/index/CompactRangeIndexJUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/Bug38741DUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/CacheXml30DUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/ClientMembershipDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/ClientMembershipSelectorDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/ClientRegisterInterestDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/ClientRegisterInterestSelectorDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/cache30/ClientServerTestCase.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/distributed/internal/LDM.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/disttx/PRDistTXDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/disttx/PRDistTXWithVersionsDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/Bug41957DUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/ClientServerGetAllDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/RemoteTransactionDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/SystemFailureDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/control/MemoryMonitorJUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/ha/HARQueueNewImplDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/ha/HARegionQueueDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/persistence/PersistentRVVRecoveryDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/tier/sockets/DestroyEntryPropagationDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/internal/cache/tier/sockets/ObjectPartListJUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/management/UniversalMembershipListenerAdapterDUnitTest.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/test/dunit/cache/internal/JUnit3CacheTestCase.java
git checkout -- geode-core/src/test/java/com/gemstone/gemfire/test/dunit/cache/internal/JUnit4CacheTestCase.java
git checkout -- geode-cq/src/test/java/com/gemstone/gemfire/cache/query/cq/dunit/CqDataUsingPoolDUnitTest.java
git checkout -- geode-cq/src/test/java/com/gemstone/gemfire/internal/cache/PutAllCSDUnitTest.java
git checkout -- geode-cq/src/test/java/com/gemstone/gemfire/internal/cache/tier/sockets/DurableClientTestCase.java
