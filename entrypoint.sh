groupmod -g $(stat -c "%g" /var/run/docker.sock) docker
chown -R jenkins /var/jenkins_home
su-exec jenkins /bin/tini -- /usr/local/bin/jenkins.sh