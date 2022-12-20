# https://hub.docker.com/r/wurstmeister/kafka/tags
FROM wurstmeister/kafka:2.13-2.8.1

RUN mkdir /prometheus
ADD "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.12.0/jmx_prometheus_javaagent-0.12.0.jar" /prometheus
ADD "exporter.yml" /prometheus/exporter.yml
ENV EXTRA_ARGS "$EXTRA_ARGS -javaagent:/prometheus/jmx_prometheus_javaagent-0.12.0.jar=61622:/prometheus/exporter.yml "
EXPOSE 61622
