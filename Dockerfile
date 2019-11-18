FROM shellbro/centos:7.7-1

RUN yum makecache fast && yum -y install epel-release &&\
    yum -y install ansible openssh-clients git && yum clean all
