FROM centos

RUN yum -y update && yum clean all

#Sophos
#Download Sophos, if link doesn't work, get a new one from: https://secure2.sophos.com/Pages/DownloadRedirect.aspx?downloadKey=8f2ca4a9-f6b1-44be-816c-d7d08461b795
#RUN curl -o /tmp/sophos.tgz http://downloads.sophos.com/inst/IcwEj6VICmbn6rrunqMKrQZD00OTkx/sav-linux-free-9.tgz && cd /tmp && tar -xzvf /tmp/sophos.tgz
COPY sav-linux-free-9.tgz /tmp/sophos.tgz
RUN cd /tmp && tar -xzvf /tmp/sophos.tgz

#Install Sophos (the --automatic flag doesn't allow us to set the edition, therefor the printf mechanism to send the choices)
RUN printf '/opt/sophos-av\nN\ns\nf\nN\n' | /tmp/sophos-av/install.sh --acceptlicence --autostart=False --enableOnBoot=False --live-protection=False --update-source-type=s
#Update the engine and definitions
RUN /opt/sophos-av/bin/savupdate -v 5
#Cleanup
RUN rm -rf /tmp/sophos*
