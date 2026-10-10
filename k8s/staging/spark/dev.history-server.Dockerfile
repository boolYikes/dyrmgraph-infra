FROM apache/spark:4.1.3-java21-scala

USER root

ADD https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-aws/3.4.2/hadoop-aws-3.4.2.jar /opt/spark/jars/
ADD https://repo.maven.apache.org/maven2/software/amazon/awssdk/bundle/2.29.52/bundle-2.29.52.jar /opt/spark/jars/
ADD https://repo.maven.apache.org/maven2/software/amazon/awssdk/url-connection-client/2.29.52/url-connection-client-2.29.52.jar /opt/spark/jars/

RUN chmod 644 /opt/spark/jars/hadoop-aws-*.jar \
    /opt/spark/jars/bundle-*.jar \
    /opt/spark/jars/url-connection-client-*.jar

USER spark