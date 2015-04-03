#!/bin/sh

set -e

source /etc/rundeck/profile

if [ -n "$RUNDECK_URL" ]; then
	echo "Setting public URL to: $RUNDECK_URL"
	sed -i -re "s|(grails.serverURL=).*|\1$RUNDECK_URL|" \
		/etc/rundeck/rundeck-config.properties
fi

exec ${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}

