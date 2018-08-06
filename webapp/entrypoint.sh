#!/bin/sh
export DISCOVERY_HOST=discovery
export DISCOVERY_PORT=8000
export CONFIG_HOST=config
export CONFIG_PORT=8081
export MAX_RETRY_COUNT=50
export PROCEED_FLAG=N

export RETRY_COUNT=0
until  [[ ${MAX_RETRY_COUNT} -eq ${RETRY_COUNT} ]]
do
    if nc -z ${DISCOVERY_HOST} ${DISCOVERY_PORT} && nc -z ${CONFIG_HOST} ${CONFIG_PORT}
    then
        export PROCEED_FLAG=Y
        break
    else
        RETRY_COUNT=$((RETRY_COUNT+1))
        echo "Retry attempt - ${RETRY_COUNT} :: Discovery/Config services are not available .. waiting for 5 seconds .."
        sleep 5
    fi
done

if [ ${PROCEED_FLAG} == "Y" ]
then
    echo "Found both discovery and config service .. proceeding"
    export JAVA_OPTS="-Xms128m -Xmx256m -XshowSettings:vm -Dspring.profiles.active=docker"
    java $JAVA_OPTS -jar /opt/microservices/lib/app.jar
else
    echo "Discovery not found within time .. exiting"
    exit 1
fi
