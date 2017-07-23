FROM jenkins/jenkins:alpine
USER root
RUN apk add --no-cache docker shadow su-exec && usermod -g docker jenkins
VOLUME /var/run/docker.sock

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT groupmod -g $(stat -c "%g" /var/run/docker.sock) docker \
    && usermod -u $(stat -c "%u" /var/jenkins_home) jenkins \
    && su-exec jenkins /bin/tini -- /usr/local/bin/jenkins.sh
