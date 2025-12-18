# Self signed SSL Certificate

## Description    
Self-signed ssl certificate with SAN tools.  
  
Command and step i'm refereing into below snippet.

[How to create a self-signed SSL Certificate with SubjectAltName(SAN)](https://gist.github.com/KeithYeh/bb07cadd23645a6a62509b1ec8986bbc)

## Tools
windows
bash  
openssl 

## Guide
Install openssl to use openssl in windows. installer can be found below,  
[openssl windows installer](https://slproweb.com/products/Win32OpenSSL.html)
```bash
git clone https://<username>:<token>@github.com/almalikzakwan/selfsigned-ssl-executer.git
cd selfsigned-ssl-executer
runas /<user>:Administrator run.bat
```

## Info  
Please always run run.bat in administrator mode. 

## License
This project is under MIT License.
