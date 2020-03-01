FROM shellbro/centos:8.1.1911-1583066294

ARG HOST_UID=999
ARG HOST_GID=999

RUN yum makecache && yum -y install epel-release &&\
    yum -y install ansible openssh-clients git && yum clean all &&\
    >&2 echo -n 'Version: ' && >&2 rpm -q ansible &&\
    groupadd -g $HOST_GID ansible-user &&\
    useradd -u $HOST_UID -g $HOST_GID ansible-user &&\
    mkdir /repo && chown ansible-user:ansible-user /repo

USER ansible-user
WORKDIR /home/ansible-user
