FROM jenkins/jenkins:lts-centos
EXPOSE 8080
EXPOSE 50000

USER root
USER jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY plugins.txt /usr/share/jenkins/ref/

# COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
