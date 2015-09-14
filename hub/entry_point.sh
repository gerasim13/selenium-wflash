#!/bin/bash

ROOT=/opt/selenium
CONF=$ROOT/config.json

echo "
{
  \"host\": null,
  \"port\": 4444,
  \"prioritizer\": null,
  \"capabilityMatcher\": \"org.openqa.grid.internal.utils.DefaultCapabilityMatcher\",
  \"throwOnCapabilityNotPresent\": true,
  \"newSessionWaitTimeout\": $GRID_NEW_SESSION_WAIT_TIMEOUT,
  \"jettyMaxThreads\": $GRID_JETTY_MAX_THREADS,
  \"nodePolling\": $GRID_NODE_POLLING,
  \"cleanUpCycle\": $GRID_CLEAN_UP_CYCLE,
  \"timeout\": $GRID_TIMEOUT,
  \"browserTimeout\": $GRID_BROWSER_TIMEOUT,
  \"maxSession\": $GRID_MAX_SESSION,
  \"unregisterIfStillDownAfter\": $GRID_UNREGISTER_IF_STILL_DOWN_AFTER
}" > $CONF

echo "starting selenium hub with configuration:"
cat $CONF

function shutdown {
    echo "shutting down hub.."
    kill -s SIGTERM $NODE_PID
    wait $NODE_PID
    echo "shutdown complete"
}

java -jar /opt/selenium/selenium-server-standalone.jar \
  ${JAVA_OPTS} \
  -role hub \
  -hubConfig $CONF &
NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait $NODE_PID
