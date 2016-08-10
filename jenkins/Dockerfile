FROM jenkins:1.651.3
 
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins
COPY install-plugins.sh /tmp/install-plugins.sh
USER root
RUN chmod +x /tmp/install-plugins.sh
RUN /tmp/install-plugins.sh maven-plugin git job-dsl chucknorris greenballs envinject gradle github view-job-filters copyartifact cloudbees-folder
COPY plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/plugins.sh /tmp/plugins.txt

#COPY plugins.txt /usr/share/jenkins/plugins.txt
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
