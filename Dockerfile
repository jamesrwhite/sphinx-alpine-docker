FROM alpine:3.3
MAINTAINER James White <dev.jameswhite@gmail.com>

ADD sphinx.conf /etc/sphinx/sphinx.conf

RUN echo "http://dl-5.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk --update add sphinx \
	&& mkdir -p /var/lib/sphinx \
	&& mkdir -p /var/lib/sphinx/data \
	&& mkdir -p /var/log/sphinx \
	&& mkdir -p /var/run/sphinx

EXPOSE 9306

CMD searchd --nodetach
