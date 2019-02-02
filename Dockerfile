FROM alpine:3.8

MAINTAINER Simon Bronner <sxb8au@gmail.com>

RUN apk --update add sudo && \
    apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi && \
    pip install ansible && \
    pip install --upgrade pycrypto pywinrm[credssp] && \
    apk --update add sshpass openssh-client rsync  && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
