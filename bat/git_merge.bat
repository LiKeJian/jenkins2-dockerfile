@ECHO OFF

ECHO *************************
ECHO ***git merge branch***
ECHO *************************
ECHO;
ECHO The root directory is the directory where the file is located.The project structure must be the following:
ECHO ../build/spring-build-parent

ECHO ../component/component-config-server
ECHO ../component/component-eureka-server
ECHO ../component/component-gateway
ECHO ../component/component-management-gateway

ECHO ../service/service-file
ECHO ../service/service-message
ECHO ../service/service-pbms
ECHO ../service/service-ulms
ECHO ../service/service-rims
ECHO ../service/service-urms

ECHO ../service-common/service-common-api
ECHO ../service-common/service-common-base
ECHO ../service-common/service-common-model
ECHO ../service-common/service-common-util
ECHO;

SET v=1.0
SET param=mayuhan
SET branch=

CHOICE /C PDRM /T 10 /D D /M "select [P/D/R/M] to merge, P:yourself, D:dev, R:release/%v%, M:master, start merge dev in ten seconds..."

REM build type:[PID]
SET a=%ERRORLEVEL%

ECHO;

IF %a%==1 (
    SET branch=%param%
)
IF %a%==2 (
    SET branch=dev
)
IF %a%==3 (
    SET branch=release/%param%
)
IF %a%==4 (
    SET branch=master
)



REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the spring-build-parent is located
CD /D ../build/spring-build-parent
ECHO start merge spring-build-parent...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish spring-build-parent...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-config-server is located
CD /D ../component/component-config-server
ECHO start merge component-config-server...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish component-config-server...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-eureka-server is located
CD /D ../component/component-eureka-server
ECHO start merge component-eureka-server...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish component-eureka-server...
ECHO;


REM REM Enter the directory where the script is located
REM CD /D %~dp0
REM REM Enter the directory where the component-gateway is located
REM CD /D ../component/component-gateway
REM ECHO start merge component-gateway...
REM git -c core.quotepath=false -c log.showSignature=false merge %branch%
REM ECHO finish component-gateway...
REM ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-management-gateway is located
CD /D ../component/component-management-gateway
ECHO start merge component-management-gateway...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish component-management-gateway...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-file is located
CD /D ../service/service-file
ECHO start merge service-file...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-file...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-message is located
CD /D ../service/service-message
ECHO start merge service-message...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-message...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-pbms is located
CD /D ../service/service-pbms
ECHO start merge service-pbms...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-pbms...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-ulms is located
CD /D ../service/service-ulms
ECHO start merge service-ulms...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-ulms...
ECHO;


REM REM Enter the directory where the script is located
REM CD /D %~dp0
REM REM Enter the directory where the service-rims is located
REM CD /D ../service/service-rims
REM ECHO start merge service-rims...
REM git -c core.quotepath=false -c log.showSignature=false merge %branch%
REM ECHO finish service-rims...
REM ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-api is located
CD /D ../service-common/service-common-api
ECHO start merge service-common-api...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-common-api...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-base is located
CD /D ../service-common/service-common-base
ECHO start merge service-common-base...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-common-base...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-model is located
CD /D ../service-common/service-common-model
ECHO start merge service-common-model...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-common-model...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-util is located
CD /D ../service-common/service-common-util
ECHO start merge service-common-util...
git -c core.quotepath=false -c log.showSignature=false merge %branch%
ECHO finish service-common-util...
ECHO;

CD /D %~dp0

ECHO.
ECHO *************************************
ECHO *****Project Checkout Completion*****
ECHO *************************************
ECHO.

PAUSE