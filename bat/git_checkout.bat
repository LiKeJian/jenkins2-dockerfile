@ECHO OFF

ECHO *************************
ECHO ***git checkout branch***
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

CHOICE /C PDRM /T 10 /D D /M "select [P/D/R/M] to checkout branch, P:yourself, D:dev, R:release/%v%, M:master, start checkout dev in ten seconds..."

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
ECHO start checkout spring-build-parent...
git checkout %branch%
ECHO finish spring-build-parent...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-config-server is located
CD /D ../component/component-config-server
ECHO start checkout component-config-server...
git checkout %branch%
ECHO finish component-config-server...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-eureka-server is located
CD /D ../component/component-eureka-server
ECHO start checkout component-eureka-server...
git checkout %branch%
ECHO finish component-eureka-server...
ECHO;


REM REM Enter the directory where the script is located
REM CD /D %~dp0
REM REM Enter the directory where the component-gateway is located
REM CD /D ../component/component-gateway
REM ECHO start checkout component-gateway...
REM git checkout %branch%
REM ECHO finish component-gateway...
REM ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the component-management-gateway is located
CD /D ../component/component-management-gateway
ECHO start checkout component-management-gateway...
git checkout %branch%
ECHO finish component-management-gateway...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-file is located
CD /D ../service/service-file
ECHO start checkout service-file...
git checkout %branch%
ECHO finish service-file...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-message is located
CD /D ../service/service-message
ECHO start checkout service-message...
git checkout %branch%
ECHO finish service-message...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-pbms is located
CD /D ../service/service-pbms
ECHO start checkout service-pbms...
git checkout %branch%
ECHO finish service-pbms...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-ulms is located
CD /D ../service/service-ulms
ECHO start checkout service-ulms...
git checkout %branch%
ECHO finish service-ulms...
ECHO;


REM REM Enter the directory where the script is located
REM CD /D %~dp0
REM REM Enter the directory where the service-rims is located
REM CD /D ../service/service-rims
REM ECHO start checkout service-rims...
REM git checkout %branch%
REM ECHO finish service-rims...
REM ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-api is located
CD /D ../service-common/service-common-api
ECHO start checkout service-common-api...
git checkout %branch%
ECHO finish service-common-api...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-base is located
CD /D ../service-common/service-common-base
ECHO start checkout service-common-base...
git checkout %branch%
ECHO finish service-common-base...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-model is located
CD /D ../service-common/service-common-model
ECHO start checkout service-common-model...
git checkout %branch%
ECHO finish service-common-model...
ECHO;


REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-util is located
CD /D ../service-common/service-common-util
ECHO start checkout service-common-util...
git checkout %branch%
ECHO finish service-common-util...
ECHO;

CD /D %~dp0

ECHO.
ECHO *************************************
ECHO *****Project Checkout Completion*****
ECHO *************************************
ECHO.

PAUSE