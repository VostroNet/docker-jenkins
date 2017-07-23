FROM jenkins/jenkins:alpine
USER root
RUN apk add --no-cache docker shadow && usermod -g docker jenkins
USER jenkins
VOLUME /var/run/docker.sock
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]