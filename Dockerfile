FROM alpine:3.5

LABEL maintainer="contact@runabove.com"

RUN apk --update add ca-certificates wget bash openjdk8-jre python2 py2-pip && \
	rm -rf /var/cache/apk && \
	wget -q http://www-eu.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz -O /tmp/kafka.tgz && \
	mkdir -p /opt && tar -xzf /tmp/kafka.tgz -C /opt && \
	mv /opt/kafka_2.11-2.1.0 /opt/kafka && \
	rm /tmp/kafka.tgz && \
	pip install --upgrade pip kafka-tools

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH /opt/kafka/bin:$PATH
