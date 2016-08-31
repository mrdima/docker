# Sophos AntiVirus Docker Image

## Manual download the software (unfortunately)
The Sophos antivirus package cannot be downloaded in a "normal" automated way, they require you to accept the license agreement, fill in a form and then a dynamic url is generated which is only available for a certain amount of time.  
Go to:
https://www.sophos.com/en-us/support/downloads/eula.aspx?downloadKey=8f2ca4a9-f6b1-44be-816c-d7d08461b795&entitlementId=00000000-0000-0000-0000-000000000000  
Check the "I accept the terms and conditions" and click Submit  
Then fill in the form and click Submit
The resulting download (sav-linux-free-9.tgz) needs to be placed in the folder containing the Dockerfile.  
To build:  
`docker built -t kpn/sophos .`
