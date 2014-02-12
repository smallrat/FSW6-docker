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

# Go to opt directory
# RUN cd /opt

# execute the install script to install and start the FSW6 platform
RUN sh /opt/install_fsw6.sh

# java -jar jboss-fsw-installer-6.0.0.GA-redhat-4.jar /opt/fsw6_installer.cfg

#######################
### TODO
#######################


# Change jboss.bind.address
## RUN sed 's/rhq.server.management.password=/rhq.server.management.password=35c160c1f841a889d4cda53f0bfc94b6/;s/jboss.bind.address=/jboss.bind.address=0.0.0.0/;s/rhq.storage.nodes=/rhq.storage.nodes=127.0.0.1/'  /opt/rhq-server-4.9.0/bin/rhq-server.properties > rhq-server.properties

# Replace old properties file with the new one
## RUN cp -u rhq-server.properties  /opt/rhq-server-4.9.0/bin/rhq-server.properties

ENV RHQ_SERVER_JAVA_EXE_FILE_PATH /usr/bin/java

## ENTRYPOINT  expect -c ' spawn su -l postgres -c " pg_ctl start " ; expect -re   "pg_log" {send \"\r\"; exp_continue } }' ;\
## su root  -c ' ./opt/rhq-server-4.9.0/bin/rhqctl install  --agent-preference="127.0.0.1" ';\
/bin/bash

