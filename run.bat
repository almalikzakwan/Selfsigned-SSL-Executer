@echo off

cd /d "%~dp0"

net session >nul 2>nul

IF %ERRORLEVEL% EQU 0 (
    CALL :main
) ELSE (
    ECHO [ERROR] PLEASE RUN THIS SCRIPT IN ADMINISTRATOR MODE.
    ECHO [INFO] THIS SCRIPT IS WAITING TO DIE.....
    TIMEOUT /T 60 /NOBREAK
)

exit /b

:main
SET /P domain="Please enter your domain name (example.com): "
SET /P password="Enter pass phrase for %domain% (min 5 character): "
START /B /W openssl genrsa -des3 -passout pass:%password% -out %domain%.key 2048
START /B /W openssl req -new -key %domain%.key -passin pass:%password% -out %domain%.csr
COPY %domain%.key %domain%.key.org
ERASE %domain%.key
START /B /W openssl rsa -in %domain%.key.org -passin pass:%password% -out %domain%.key
ERASE %domain%.key.org
(
echo subjectKeyIdentifier   = hash
echo authorityKeyIdentifier = keyid:always,issuer:always
echo basicConstraints       = CA:TRUE
echo keyUsage               = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment, keyAgreement, keyCertSign
echo subjectAltName         = DNS:%domain%, DNS:*.%domain%
echo issuerAltName          = issuer:copy
) > %domain%.ext
SET days=3650
SET /P days="Certificate Validity Period (press enter for default 3650 days): "
START /B /W openssl x509 -req -in %domain%.csr -signkey %domain%.key -out %domain%.crt -days %days% -sha256 -extfile %domain%.ext
echo [INFO] SELF SIGNED SSL CERTIFICATE SUCCESSFULLY CREATED!
echo [INFO] INSTALLING %domain%.crt certificate file into Trusted Root Certificate Authorities...
certutil -addstore "Root" "%CD%\%domain%.crt"
echo [INFO] THIS PROGRAM IS WAITING TO DIE......

TIMEOUT /T 40