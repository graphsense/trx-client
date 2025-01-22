FROM eclipse-temurin:8
LABEL org.opencontainers.image.title="trx-client"
LABEL org.opencontainers.image.maintainer="contact@ikna.io"
LABEL org.opencontainers.image.url="https://www.ikna.io/"
LABEL org.opencontainers.image.description="Dockerized Tron client"
LABEL org.opencontainers.image.source="https://github.com/graphsense/trx-client"

ENV TZ=UTC
ARG UID=10000

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        libgoogle-perftools4 \
        wget && \
    useradd -m -r -u $UID -d /opt/graphsense dockeruser &&  \
    mkdir -p /opt/graphsense/data && \
    chown -R dockeruser /opt/graphsense

USER dockeruser
RUN wget https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.7.7/FullNode.jar -O /opt/graphsense/FullNode.jar
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4"
ENV TCMALLOC_RELEASE_RATE=10
ADD conf/main_net_config.conf /opt/graphsense/client.conf
ADD logback.xml /opt/graphsense/logback.xml
WORKDIR /opt/graphsense

CMD ["java", "-Xmx24g", "-XX:+UseConcMarkSweepGC", "-jar", "FullNode.jar", "-c", "/opt/graphsense/client.conf", "--output-directory", "/opt/graphsense/data", "--log-config", "/opt/graphsense/logback.xml"]
