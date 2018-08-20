FROM wurstmeister/kafka:1.0.0

RUN mkdir /prometheus
ADD "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.10/jmx_prometheus_javaagent-0.10.jar" /prometheus
ADD "exporter.yml" /prometheus/exporter.yml
ENV EXTRA_ARGS "$EXTRA_ARGS -javaagent:/prometheus/jmx_prometheus_javaagent-0.10.jar=61622:/prometheus/exporter.yml "
ADD "wait-for-it.sh" /build/wait-for-it.sh
RUN chmod +x /build/wait-for-it.sh
EXPOSE 61622
