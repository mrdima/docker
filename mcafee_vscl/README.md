# McAfee VirusScan Command Line for Unix Docker Image

## Manual download the software (unfortunately)
The McAfee VirusScan Command Line for Unix package cannot be downloaded in a "normal" automated way, they require you to accept the license agreement, fill in a form and then a dynamic url is generated which is only available for a certain amount of time.  
As long as we do not have a licensed version, go to:  
http://www.mcafee.com/apps/downloads/free-evaluations/  
Select Endpoint Protection in the pull down, then click McAfee VirusScan Command Line for Linux 64bit  
Fill in the Form (incl Captcha), submit and download.  
The resulting download (vscl-l64-606-e.tar.gz) needs to be placed in the folder containing the Dockerfile.  
To build:  
`docker built -t kpn/mcafee .`

