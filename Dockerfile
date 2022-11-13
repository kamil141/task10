FROM  jenkins/jenkins:lts-jdk11
VOLUME /var/jenkins_home
EXPOSE 8080
EXPOSE 50000

USER jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY plugins.txt /usr/share/jenkins/ref/
COPY casc.yaml /var/jenkins_home/casc.yaml
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
