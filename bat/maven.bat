@ECHO OFF

ECHO **********************
ECHO ***maven build tool***
ECHO **********************
ECHO;
ECHO The root directory is the directory where the file is located.The project structure must be the following:
ECHO ../build/spring-build-parent/pom.xml
ECHO ../service-common/service-common-model/pom.xml
ECHO ../service-common/service-common-util/pom.xml
ECHO ../service-common/service-common-base/pom.xml
ECHO;


CHOICE /C PIDC /T 10 /D P /M "select [P/I/D/C] to build project, P:package, I:install, D:deploy, C:clean, start package in ten seconds..."

REM build type:[PID]
SET a=%ERRORLEVEL%

ECHO;

CHOICE /C SMUAB /T 10 /D S /M "select [S/M/U/A/B] to build project, S:spring-build-parent, M:service-common-model, U:service-common-util, A:service-common-api, B:service-common-base, start build spring-build-parent in ten seconds..."

IF %ERRORLEVEL%==1 GOTO SPRING
IF %ERRORLEVEL%==2 GOTO MODEL
IF %ERRORLEVEL%==3 GOTO UTIL
IF %ERRORLEVEL%==4 GOTO API
IF %ERRORLEVEL%==5 GOTO BASE

ECHO;

:SPRING
REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the spring-build-parent is located
CD /D ../build/spring-build-parent
ECHO start build spring-build-parent...
IF %a%==1 (
    CALL mvn clean package
) ELSE IF %a%==2 (
    CALL mvn clean install
) ELSE IF %a%==3 (
	CALL mvn clean deploy
) ELSE (
	CALL mvn clean
)
ECHO finish spring-build-parent...
ECHO;
REM pause 3 seconds
REM CHOICE /T 3 /D Y /N >nul
ECHO.

:MODEL
REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-model is located
CD /D ../service-common/service-common-model
ECHO start build service-common-model...
IF %a%==1 (
    CALL mvn clean package
) ELSE IF %a%==2 (
    CALL mvn clean install
) ELSE IF %a%==3 (
	CALL mvn clean deploy
) ELSE (
	CALL mvn clean
)
ECHO finish service-common-model...
ECHO;
REM pause 3 seconds
REM CHOICE /T 3 /D Y /N >nul
ECHO.

:UTIL
REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-util is located
CD /D ../service-common/service-common-util
ECHO start build service-common-util...
IF %a%==1 (
    CALL mvn clean package
) ELSE IF %a%==2 (
    CALL mvn clean install
) ELSE IF %a%==3 (
	CALL mvn clean deploy
) ELSE (
	CALL mvn clean
)
ECHO finish service-common-util...
ECHO;
REM CHOICE /T 3 /D Y /N >nul
ECHO.

:API
REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-api is located
CD /D ../service-common/service-common-api
ECHO start build service-common-api...
IF %a%==1 (
    CALL mvn clean package
) ELSE IF %a%==2 (
    CALL mvn clean install
) ELSE IF %a%==3 (
	CALL mvn clean deploy
) ELSE (
	CALL mvn clean
)
ECHO finish service-common-api...
ECHO;
REM CHOICE /T 3 /D Y /N >nul
ECHO.

:BASE
REM Enter the directory where the script is located
CD /D %~dp0
REM Enter the directory where the service-common-base is located
CD /D ../service-common/service-common-base
ECHO start build service-common-base...
IF %a%==1 (
    CALL mvn clean package
) ELSE IF %a%==2 (
    CALL mvn clean install
) ELSE IF %a%==3 (
	CALL mvn clean deploy
) ELSE (
	CALL mvn clean
)
ECHO finish service-common-base...
ECHO;
REM CHOICE /T 3 /D Y /N >nul
ECHO.
ECHO.

CD /D %~dp0

ECHO *************************************
ECHO ***Project Construction Completion***
ECHO *************************************
ECHO.
ECHO.

PAUSE