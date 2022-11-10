FROM alpine:3.16.2

# install ansible
RUN apk update
RUN apk add --no-cache ansible openssh

# add user
RUN adduser -D controller
# Create Workingfile
RUN mkdir -p /data && chown -R controller /data && chmod -R 777 /etc/ssh \
    && mkdir -p /etc/ansible && chown -R controller /etc/ansible \
    && echo "StrictHostKeyChecking accept-new" >> /etc/ssh/ssh_config

USER controller

# Create ssh key
WORKDIR /home/controller
RUN ssh-keygen -A && mkdir .ssh

# Set working directory
WORKDIR /etc/ansible

CMD ["/usr/sbin/sshd","-D"]