FROM wurstmeister/kafka:0.10.1.0-2

RUN mkdir /prometheus
ADD "https://bitbucket.org/sagent/downloads/downloads/jmx_prometheus_javaagent-0.6.jar" /prometheus
ADD "exporter.yml" /prometheus/exporter.yml
ENV EXTRA_ARGS "$EXTRA_ARGS -javaagent:/prometheus/jmx_prometheus_javaagent-0.6.jar=61622:/prometheus/exporter.yml "

EXPOSE 61622
