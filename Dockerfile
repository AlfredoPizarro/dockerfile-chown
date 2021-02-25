FROM jboss/wildfly:16.0.0.Final
USER root
RUN mkdir -p /opt/folder/config &&     mkdir -p /opt/folder/log &&     userdel jboss &&     useradd -l -u 1000920000 jboss &&     chown -R jboss:jboss /opt/folder &&     chown -R jboss:jboss $JBOSS_HOME/ && chown -R jboss:jboss /opt
USER jboss
COPY config/ /opt/folder/config
COPY src/mssql-jdbc-8.4.0.jre8.jar /opt/folder
COPY src/sampleapp.war /opt/folder
COPY src/sampleapp.war /opt/jboss/wildfly/standalone/deployments
EXPOSE 8080 9990
CMD ["/bin/bash -c","/opt/jboss/wildfly/bin/standalone.sh", "-b" "0.0.0.0"]
