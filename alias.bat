@echo off

::--------------------------------------------------------------------
::
::	ALAIS.BAT	ver 1.01
::
::	A tool for quickly writing aliases under Windows
::
::	(c) Paul Mann 2017 (20170909)
::
::
::--------------------------------------------------------------------



set file=alias.config
if "%1"=="-f" (
  set file=%2
  shift
  shift
)

if "%1"=="-h" goto usage


if "%1"=="-a" goto _add
if "%1"=="-i" goto _interactive
if "%1"=="-l" goto _list

goto _config

:_list


  echo.
  echo Alias		: Command
  echo.

  for /f "tokens=1,2 delims=#" %%a in (%file%) do (
    echo %%a		: %%b



)
goto end

:_interactive

  echo.
  echo alias INTERACTIVE mode
  echo.
  set /p alias=Name of Alais: 

  echo.
  echo Use: command [args] where [args] is either exact arguments (eg dir /b /w)
  echo or variables in the form of $1 ... $9 for %%1 ... %%9 or $n for all arguments
  echo.
  set /p cmd=Command: 
  set /p desc=description

  echo %alias%#%cmd%#%desc% >> %file%

  goto end





echo args = %args%


:_add

  if "%4"=="" set args=$* goto _write
  if "%5"=="-n" set args="" & goto _write
  set args=%4

:_write

  echo %2#%3#%args% >> %file%
  goto end

:_config

  for /f "tokens=1,2delims=#" %%a in (%file%) do (
    doskey %%a=%%b $*
)
goto end
:usage

  if "%~2"=="" echo. & call :_GenHlp & goto end

  for /f "tokens=1-3 delims=#" %%a in (%file% ^| findstr "%2") do (

      echo.
      echo %%a		: %%b
      echo.
    if "%%c"=="" goto end
      echo %%c
    goto end
)
:_GenHlp


echo.
echo Quick and dirty ALIAS command written in Batch for windows
echo.
echo USAGE:
echo.
echo ALIAS [-A ^<alias^> ^<command^>][-I][-L][-F ^<file^>][-h [^<alias^>]]
echo.
echo ALIAS	: Processes the alias.config file and sets up aliases
echo.
echo -A	: Create a simple alias with a simple command (eg. ALIAS -A clear cls)
echo.
echo -I	: Interactive mode for creating more complex aliases
echo.
echo -L	: Lists all aliases and commands in ALIAS.CONFIG file
echo.
echo -F	: For using a file other than the default (alias.config)
echo.
echo -H	: Displays this page or the description of the named alias
echo.
echo NOTE: if invoking -F ^<file^> with other options it must be done first
)
:end

exit /b
