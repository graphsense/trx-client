FROM eclipse-temurin:8
LABEL maintainer="contact@iknaio.com"

ENV TZ=UTC
ARG UID=10000

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        libgoogle-perftools4 \
        wget && \
    useradd -m -r -u $UID -d /home/dockeruser dockeruser
RUN wget https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.7.2/FullNode.jar -O /home/dockeruser/FullNode.jar && \
    chown dockeruser:dockeruser /home/dockeruser/FullNode.jar

USER dockeruser
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4"
ENV TCMALLOC_RELEASE_RATE=10
ADD conf/main_net_config.conf /home/dockeruser/main_net_config.conf
ADD logback.xml /home/dockeruser/logback.xml
WORKDIR /home/dockeruser

CMD ["java", "-Xmx24g", "-XX:+UseConcMarkSweepGC", "-jar", "FullNode.jar", "-c", "main_net_config.conf", "--log-config", "logback.xml"]
