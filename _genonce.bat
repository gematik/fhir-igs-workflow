@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache

SET "DEFAULT_PROXY_URL=http://192.168.110.10:3128"
SET "PROXY_URL="
SET "PROXY_STR="
SET "PROXY_HOST="
SET "PROXY_PORT="
SET "USE_PROXY=0"

IF DEFINED HTTPS_PROXY SET "PROXY_URL=%HTTPS_PROXY%"
IF NOT DEFINED PROXY_URL IF DEFINED HTTP_PROXY SET "PROXY_URL=%HTTP_PROXY%"

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
IF "!PROXY_URL!"=="" SET "PROXY_URL=%DEFAULT_PROXY_URL%"
IF DEFINED PROXY_URL (
	SET "USE_PROXY=1"
	SET "PROXY_STR=!PROXY_URL!"
	IF /I "!PROXY_STR:~0,7!"=="http://" SET "PROXY_STR=!PROXY_STR:~7!"
	IF /I "!PROXY_STR:~0,8!"=="https://" SET "PROXY_STR=!PROXY_STR:~8!"
	FOR /F "tokens=1,2 delims=@" %%A IN ("!PROXY_STR!") DO (
		IF NOT "%%B"=="" SET "PROXY_STR=%%B"
	)
	FOR /F "tokens=1,2 delims=:" %%A IN ("!PROXY_STR!") DO (
		SET "PROXY_HOST=%%A"
		SET "PROXY_PORT=%%B"
	)
)
IF "!USE_PROXY!"=="1" (
	ECHO Ping failed; using proxy settings.
	SET txoption=
	GOTO igpublish
)
ECHO We're offline...
SET txoption=-tx n/a
GOTO igpublish

:isonline
ECHO We're online
SET txoption=

:igpublish

SET "JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8"
IF "!USE_PROXY!"=="1" IF DEFINED PROXY_HOST IF DEFINED PROXY_PORT (
	SET "JAVA_TOOL_OPTIONS=!JAVA_TOOL_OPTIONS! -Dhttp.proxyHost=!PROXY_HOST! -Dhttp.proxyPort=!PROXY_PORT! -Dhttps.proxyHost=!PROXY_HOST! -Dhttps.proxyPort=!PROXY_PORT!"
)

IF EXIST "%input_cache_path%\%publisher_jar%" (
	JAVA -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
) ELSE If exist "..\%publisher_jar%" (
	JAVA -jar "..\%publisher_jar%" -ig . %txoption% %*
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

PAUSE
