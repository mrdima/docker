FROM centos:7

#Update, clean, install dependencies
RUN yum -y update && yum clean all && yum install -y file ftp unzip

#McAfee VirusScan Enterprise
#No direct download (need to request trial which generates dynamic url which is not available anymore after a while). Waiting for KPN Object store (Harry working on it)
COPY vscl-l64-606-e.tar.gz /tmp
#Extract and install
RUN mkdir -p /tmp/mcafee && cd /tmp/mcafee && tar -xvzf ../vscl*.tar.gz --strip-components 1 && ./install-uvscan -y
COPY update_dat.sh /usr/local/uvscan
#The copy below isn't really neccesary if we only scan the data directory we're not using it currently
COPY exclusions.txt /usr/local/uvscan
#Getting new definitions isn't really neccesary, we'll do that anyway when starting up, left it in for now, we might even do a scan of the container
RUN /usr/local/uvscan/update_dat.sh && rm -rf /tmp/vscl* /tmp/mcafee
#Entrypoint to uvscan could be considered but we want to update first anyways so this isn't too useful unless we make a wrapperscript for update_and_scan and make that the entrypoint
