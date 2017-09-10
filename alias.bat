@echo off

::--------------------------------------------------------------------
::
::	ALAIS.BAT	ver 1.00
::
::	A tool for quickly writing aliases under Windows
::
::	(c) Paul Mann 2017 (20170909)
::
::
::--------------------------------------------------------------------



if "%1"=="-a" goto _add
if "%1"=="-i" goto _interactive
if "%1"=="-l" goto _list

goto _config

:_list


  echo.
  echo Alias		: Command
  echo.

  for /f "tokens=1,2 delims=#" %%a in (alias.config) do (
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

  echo %alias%#%cmd%# >> alias.config

  goto end





echo args = %args%


:_add

  if "%4"=="" set args=$* goto _write
  if "%5"=="-n" set args="" & goto _write
  set args=%4

:_write

  echo %2#%3#%args% >> alias.config
  goto end

:_config

  for /f "tokens=1,2delims=#" %%a in (alias.config) do (
    doskey %%a=%%b $*
)

:end

exit /b