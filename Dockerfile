FROM centos:centos7



LABEL description="This is a base image to build and run apps"


ENV JAVA_HOME=/usr
ENV LANG=en_US.UTF-8
ENV NAME=NARIMAN

RUN VERSION=12.0.2 && \
    BUILD=10 && \
    NODE=12.x && \
    NGINX=1.16.1 && \
    MAVEN=3.6.3 && \
    curl -sL https://rpm.nodesource.com/setup_"${NODE}" | bash - && \
    yum -y update && \
    yum install -y gcc-c++ make java-11-openjdk java-11-openjdk-devel wget nodejs nginx-"${NGINX}" ca-certificates git nss curl libcurl && \
    yum clean all && \
    rm -rf /tmp/* /var/cache/yum/* /var/tmp/* && \
    update-ca-trust enable && \
    update-ca-trust extract && \
    keytool -import -trustcacerts -alias taxes-root-ca -file /etc/pki/ca-trust/source/anchors/TAXES-ROOT-CA.crt -keystore "/etc/pki/ca-trust/extracted/java/cacerts"  -storepass changeit --noprompt && \
    wget http://mirrors.hostingromania.ro/apache.org/maven/maven-3/"${MAVEN}"/binaries/apache-maven-"${MAVEN}"-bin.tar.gz -O /opt/apache-maven-"${MAVEN}"-bin.tar.gz && \
    tar -xf /opt/apache-maven-"${MAVEN}"-bin.tar.gz -C /opt && \
    rm -f /opt/apache-maven-"${MAVEN}"-bin.tar.gz && \
    ln -s /opt/apache-maven-"${MAVEN}" /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn
