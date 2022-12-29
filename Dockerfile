FROM bitnami/kafka:3.3.1

USER root

RUN mkdir /prometheus
ADD "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.17.2/jmx_prometheus_javaagent-0.17.2.jar" /prometheus
ADD "exporter.yml" /prometheus/exporter.yml
ENV EXTRA_ARGS "$EXTRA_ARGS -javaagent:/prometheus/jmx_prometheus_javaagent-0.17.2.jar=61622:/prometheus/exporter.yml "
EXPOSE 61622

USER 1001