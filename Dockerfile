FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

# - Install basic packages needed by supervisord
# - Install supervisord (via python's easy_install - as it has the newest 3.x version)
RUN \
  yum install -y epel-release python-setuptools && \
  yum update -y && \
  yum clean all && \

  easy_install supervisor && \
  mkdir -p /etc/supervisord.d /var/log/supervisor


# Bootstrap
RUN mkdir -p /config/init /config/data /config/temp
ADD config/ /config/

ADD supervisord.conf /etc/supervisord.conf

CMD ["/config/bootstrap.sh"]