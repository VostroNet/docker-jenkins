groupmod -g $(stat -c "%g" /var/run/docker.sock) docker
#usermod -u $(stat -c "%u" /var/jenkins_home) jenkins
su-exec jenkins /bin/tini -- /usr/local/bin/jenkins.sh