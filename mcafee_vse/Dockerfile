#This doesn't work, the VSE won't containerize, won't install at some stage, left it as a reference

FROM centos:7

RUN yum -y update && yum clean all

#McAfee VirusScan Enterprise
#No direct download (need to check)
COPY McAfeeVSEForLinux-2.0.3.29216.zip /tmp/mcafee.zip
COPY nails.options /root
#Install dependencies
RUN yum install -y ed bind-utils psmisc unzip
#Extract
RUN cd /tmp && mkdir mcafee && unzip -j mcafee.zip && tar -xvzf McAfee*.tar.gz && tar -xvzf *-release.tar.gz && tar -xvzf *-others.tar.gz
#Install
#RUN cd /tmp && yum -y localinstall MFErt.i686.rpm MFEcma.i686.rpm && bash ./McAfeeVSEForLinux*-installer
RUN cat /proc/mounts 
RUN cd /tmp && rpm -ivh MFErt.i686.rpm
#Insert On-Demand task
RUN /opt/NAI/LinuxShield/libexec/sqlite /var/opt/NAI/LinuxShield/etc/nailsd.db 'INSERT INTO schedule (taskName, timetable, taskType,taskInfo,status) VALUES ("dimi-scan","type=unscheduled","On-Demand","profileName=ODS_2,paths=path:/;exclude:false","Idle")'
#TODO, create the On-Demand profile (not included, see remarks)
COPY ods.cfg /var/opt/NAI/LinuxShield/etc/ods.cfg
#TODO: update
nails task --run 1
#TODO: run scan
nails task --run 2


#add this without quotes to the default ods.cfg
#nailsd.profile.ODS_2.allFiles: true
#nailsd.profile.ODS_2.childInitTmo: 240
#nailsd.profile.ODS_2.cleanChildren: 2
#nailsd.profile.ODS_2.cleansPerChild: 10000
#nailsd.profile.ODS_2.datPath: /opt/NAI/LinuxShield/engine/dat
#nailsd.profile.ODS_2.decompArchive: true
#nailsd.profile.ODS_2.decompExe: true
#nailsd.profile.ODS_2.engineLibDir: /opt/NAI/LinuxShield/engine/lib
#nailsd.profile.ODS_2.enginePath: /opt/NAI/LinuxShield/engine/lib/liblnxfv.so
#nailsd.profile.ODS_2.factoryInitTmo: 240
#nailsd.profile.ODS_2.heuristicAnalysis: true
#nailsd.profile.ODS_2.macroAnalysis: true
#nailsd.profile.ODS_2.maxQueSize: 32
#nailsd.profile.ODS_2.mime: true
#nailsd.profile.ODS_2.noJokes: false
#nailsd.profile.ODS_2.program: true
#nailsd.profile.ODS_2.quarantineChildren: 1
#nailsd.profile.ODS_2.quarantineDirectory: /quarantine
#nailsd.profile.ODS_2.quarantineFromRemoteFS: false
#nailsd.profile.ODS_2.quarantinesPerChild: 10000
#nailsd.profile.ODS_2.scanChildren: 2
#nailsd.profile.ODS_2.scanMaxTmo: 300
#nailsd.profile.ODS_2.scanNWFiles: false
#nailsd.profile.ODS_2.scanOnRead: true
#nailsd.profile.ODS_2.scanOnWrite: true
#nailsd.profile.ODS_2.scannerPath: /opt/NAI/LinuxShield/libexec/scanner
#nailsd.profile.ODS_2.scansPerChild: 10000
#nailsd.profile.ODS_2.slowScanChildren: 0
#nailsd.profile.ODS_2.action.error: Block
#nailsd.profile.ODS_2.action.timeout: Pass
#nailsd.profile.ODS_2.action.App.primary: Pass
#nailsd.profile.ODS_2.action.Default.primary: Pass
#nailsd.profile.ODS_2.filter.0.path: /proc
#nailsd.profile.ODS_2.filter.0.subdir: true
#nailsd.profile.ODS_2.filter.0.type: exclude-path
#nailsd.profile.ODS_2.filter.1.path: /quarantine
#nailsd.profile.ODS_2.filter.1.subdir: true
#nailsd.profile.ODS_2.filter.1.type: exclude-path
#nailsd.profile.ODS_2.filter.extensions.mode: all
#nailsd.profile.ODS_2.filter.extensions.type: extension
