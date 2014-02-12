#Dockerfile for FSW6 

FROM mattdm/fedora

MAINTAINER Tomas Plevko <tplevko@redhat.com>

# install missing commands
RUN yum -y update
RUN yum -y install wget  unzip vim  expect spawn

# Install java
RUN yum -y install java-1.7.0-openjdk-devel

# Download fsw .jar from access... //TODO : find another location
# RUN wget 
ADD jboss-fsw-installer-6.0.0.GA-redhat-4.jar /opt/

# Get install .cfg file for FSW6
RUN wget https://raw2.github.com/tplevko/FSW6-docker/master/dockerfile/fsw6_installer.cfg -O /opt/fsw6_installer.cfg

# Get startup script for FSW6
RUN wget https://raw2.github.com/tplevko/FSW6-docker/master/dockerfile/install_fsw6.sh -O /opt/install_fsw6.sh

# execute the install script to install and start the FSW6 platform
RUN java -jar /opt/jboss-fsw-installer-6.0.0.GA-redhat-4.jar /opt/fsw6_installer.cfg

# Change jboss.bind.address
RUN sed -i 's;value=\"\${jboss\.bind\.address\.management:.*$;value=\"\${jboss.bind.address.management:0.0.0.0}"/>;g' /opt/jboss-fsw6/jboss-eap-6.1/standalone/configuration/standalone.xml
RUN sed -i 's;value=\"\${jboss\.bind\.address:.*$;value=\"\${jboss.bind.address:0.0.0.0}"/>;g' /opt/jboss-fsw6/jboss-eap-6.1/standalone/configuration/standalone.xml

##################
## TODO : nohup
##        set offset to 10000
##################

ENV RHQ_SERVER_JAVA_EXE_FILE_PATH /usr/bin/java

ENTRYPOINT './opt/jboss-fsw6/jboss-eap-6.1/bin/standalone.sh';\
/bin/bash
