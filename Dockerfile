FROM kscape/docker-oracle-java:latest

ENV KAFKA_VERSION="0.10.0.1" SCALA_VERSION="2.11"

RUN \
    apt-get install -y net-tools && \
    wget -q -O - \
    http://apache.cs.utah.edu/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz  | \
    tar -xzf - -C /opt

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ENV KAFKA_OFFSETS_STORAGE kafka
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
ADD create-topics.sh /usr/bin/create-topics.sh

WORKDIR $KAFKA_HOME

CMD ["start-kafka.sh"]
