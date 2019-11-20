FROM shellbro/centos:7.7-1

ARG UID=1000
ARG GID=1000
ARG LOGIN=user

RUN yum makecache fast && yum -y install epel-release &&\
    yum -y install ansible openssh-clients git && yum clean all &&\
    >&2 rpm -q ansible &&\
    groupadd -g $GID $LOGIN && useradd -u $UID -g $GID $LOGIN &&\
    mkdir /repo && chown $LOGIN:$LOGIN /repo

USER $LOGIN
WORKDIR /home/$LOGIN
