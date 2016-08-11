FROM centos:centos6
MAINTAINER Mirnes Omerkic <mirnes.omerkic@atlantbh.com>

# Update 
RUN yum -y update && yum clean all

# Install jdk and git
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk.x86_64
RUN yum -y install java-1.8.0-openjdk-devel git && yum clean all
ENV PATH $JAVA_HOME/bin:$PATH

# Install maven
ENV MAVEN_VERSION 3.3.9
ENV MAVEN_TGZ_URL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
ENV MAVEN_HOME /usr/share/maven

RUN mkdir -p $MAVEN_HOME && \
  curl -fsSL $MAVEN_TGZ_URL | tar -xzC $MAVEN_HOME --strip-components=1

ENV PATH $MAVEN_HOME/bin:$PATH

# Install tomcat
ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.70
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p $CATALINA_HOME

ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

RUN curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz && \
  tar -xvf tomcat.tar.gz --strip-components=1 && \
  rm bin/*.bat && \
  rm tomcat.tar.gz* 

# Build and deploy petclinic (forked with mysql config)
#RUN git clone https://github.com/mrdima/spring-petclinic.git /home/spring-petclinic && \
RUN git clone https://github.com/mrdima/spring-petclinic.git /home/spring-petclinic && \
  cd /home/spring-petclinic && \
  git checkout mysql && \
  git reset --hard origin/mysql && \
  mvn install -DskipTests && \
  cp target/petclinic.war ${CATALINA_HOME}/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
