FROM phusion/baseimage
MAINTAINER Spencer Lievens <s.lievens@duality.solutions>

ARG USER_ID
ARG GROUP_ID

ENV HOME /dynamic

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} dynamic
RUN useradd -u ${USER_ID} -g dynamic -s /bin/bash -m -d /dynamic dynamic

RUN chown dynamic:dynamic -R /dynamic

ADD https://github.com/duality-solutions/Dynamic/releases/download/v2.4.3.0/Dynamic-2.4.3.0-Linux-x64.tar.gz /tmp/
RUN tar -xvf /tmp/Dynamic-2.4.3.0-Linux-x64.tar.gz -C /tmp/
RUN cp /tmp/dynamic*/bin/*  /usr/local/bin
RUN rm -rf /tmp/dynamic*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# For some reason, docker.io (0.9.1~dfsg1-2) pkg in Ubuntu 16.04 has permission
# denied issues when executing /bin/bash from trusted builds.  Building locally
# works fine (strange).  Using the upstream docker (0.11.1) pkg from
# http://get.docker.io/ubuntu works fine also and seems simpler.
USER dynamic

VOLUME ["/dynamic"]

EXPOSE 33350 33300 33350 33400

WORKDIR /dynamic

CMD ["dynamic_oneshot"]
