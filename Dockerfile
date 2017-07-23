FROM jenkins/jenkins:alpine
USER root
RUN apk add --no-cache docker shadow su-exec && usermod -g docker jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN rm -f /var/run/docker.sock

ENTRYPOINT /entrypoint.sh
