# Pull base image.
FROM bigboards/cdh-base-__arch__

MAINTAINER bigboards
USER root 

RUN apt-get update \
    && apt-get install -y hue \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

ADD docker_files/hue-run.sh /apps/hue-run.sh
RUN chmod a+x /apps/*.sh

# declare the volumes
RUN mkdir /etc/hue/conf.bb \
 && update-alternatives --install /etc/hue/conf hue-conf /etc/hue/conf.bb 1 \
 && update-alternatives --set hue-conf /etc/hue/conf.bb
VOLUME /etc/hue/conf.bb

# external ports
EXPOSE 8888

CMD ["/apps/hue-run.sh"]
