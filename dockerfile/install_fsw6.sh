#!/bin/sh
DEST="opt"
FSW6_HOME_STANDALONE="jboss-fsw6"
FSW6_HOME=${DEST}/${FSW6_HOME_STANDALONE}
FSW6_INSTALLER="jboss-fsw-installer-6.0.0.GA-redhat-4.jar"

create_fsw_instance(){

      port_offset=10000

      echo "Starting FSW6 instance on port offset ${port_offset}..."
      profile_file=/${FSW6_HOME}/jboss-eap-6.1/standalone/configuration/standalone.xml
      sed -i 's;value=\"\${jboss\.bind\.address\.management:.*$;value=\"\${jboss.bind.address.management:0.0.0.0}"/>;g' ${profile_file}
      sed -i 's;value=\"\${jboss\.bind\.address:.*$;value=\"\${jboss.bind.address:0.0.0.0}"/>;g' ${profile_file}
      sed -i 's;port-offset=\"\${jboss\.socket\.binding\.port-offset:.*$;port-offset=\"\${jboss.socket.binding.port-offset:'$port_offset'}">;g' ${profile_file}
    
      nohup "/${FSW6_HOME}/jboss-eap-6.1/bin/standalone.sh -Djboss.server.base.dir=/${FSW6_HOME}/jboss-eap-6.1/standalone "> /dev/null 2>&1 &

}

echo "Install FSW 6 ..."

## java -jar ${FSW6_INSTALLER} /opt/fsw6_installer.cfg

echo "Start server ..."

create_fsw_instance

exit 0
