# Pull base image.
#FROM bigboards/cdh-base-__arch__
FROM bigboards/cdh-base-x86_64

MAINTAINER bigboards
USER root 

RUN apt-get update && apt-get install -y hue

ADD docker_files/hue-run.sh /apps/hue-run.sh
RUN chmod a+x /apps/*.sh

# external ports
EXPOSE 8888

CMD ["/apps/hue-run.sh"]
