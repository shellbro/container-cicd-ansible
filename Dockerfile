FROM shellbro/centos:8.1.1911-1583066294

RUN yum makecache && yum -y install epel-release &&\
    yum -y install ansible openssh-clients git && yum clean all &&\
    >&2 echo -n 'Version: ' && >&2 rpm -q ansible &&\
    groupadd -g 1001 ansible-user && useradd -u 1001 -g 1001 ansible-user &&\
    mkdir /repo && chown ansible-user:ansible-user /repo

USER ansible-user
