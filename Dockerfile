FROM shellbro/centos:8.1.1911-1586073474

RUN yum makecache && yum -y install epel-release &&\
    yum -y install ansible openssh-clients git && yum clean all &&\
    >&2 echo -n 'Version: ' && >&2 rpm -q ansible &&\
    groupadd -g 1001 non-root && useradd -u 1001 -g 1001 non-root &&\
    mkdir /repo && chown non-root:non-root /repo

USER non-root
