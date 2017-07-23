FROM jenkins/jenkins:alpine
USER root
RUN apk add --no-cache docker shadow gosu && usermod -g docker jenkins
VOLUME /var/run/docker.sock
ENTRYPOINT groupmod -g $(stat -c "%g" /var/run/docker.sock) docker \
    && usermod -u $(stat -c "%u" /var/jenkins_home) jenkins \
    && gosu jenkins /bin/tini -- /usr/local/bin/jenkins.sh
