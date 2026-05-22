# Self signed SSL Certificate

## Description
Self-signed ssl certificate with Subject Alternative Name(SAN) tools. Simple automation to tool to create self-signed SSL certificate. Enter your domain name and pass phrase and enjoy!.  

This tools is using Command Line Interface and bash terminal linux. 
  
Command and step i'm referring into below snippet.  
  
Windows:  
[How to create a self-signed SSL Certificate with SubjectAltName(SAN)](https://gist.github.com/KeithYeh/bb07cadd23645a6a62509b1ec8986bbc)  
  
Linux:  
[Creating a Self-Signed Certificate](https://gist.github.com/elklein96/a15090f35a41e16bdc8574a7fb81e119)  

## Tools
windows
batch  
linux
bash 
openssl

## Guide

### Windows
Install openssl to use openssl in windows. installer can be found below,  
[openssl windows installer](https://slproweb.com/products/Win32OpenSSL.html)
```bash
git clone https://<username>:<token>@github.com/almalikzakwan/selfsigned-ssl-executer.git
cd selfsigned-ssl-executer
runas /<user>:Administrator run.bat
```
  
### Linux
```bash
git clone https://<username>:<token>@github.com/almalikzakwan/selfsigned-ssl-executer.git
cd selfsigned-ssl-executer
sudo chmod +x run.sh
sudo ./run.sh
```
  
Note: Common name must be same with your domain.name
  
## Info  
Please always run run.bat/run.sh in administrator mode. 
This software built only for my learning in batch/bash scripting.  
  
Before you run the execution, please create a outputs folder for windows user.  
   
## License 
This project is under MIT License.
