FROM python:3.10.8-alpine3.16

ARG SSH_PUB_KEY

RUN apk add --no-cache openssh openrc

RUN adduser -D node

RUN mkdir -p /run/openrc \
    && chmod -R 777 /run/openrc && chmod -R 777 /etc/ssh \
    && touch /run/openrc/softlevel \
    && echo "Port 22" >> /etc/ssh/ssh_config && echo "UserKnownHostsFile ~/.ssh/known_hosts.d/%k" >> /etc/ssh/ssh_config  \
    && mkdir -p /data && chown -R node /data

USER node

WORKDIR /data

RUN chown -R node . \
    && mkdir -p /home/node/.ssh \
    && echo $SSH_PUB_KEY > /home/node/.ssh/authorized_keys

EXPOSE 22

CMD ["sh", "-c", "ssh-keygen -A;/usr/sbin/sshd -D"]