@echo off
rem *************************************************  
rem * Script to compile the solutions of HelloWorld *  
rem * Created by: Yingguang Mei                     *  
rem * Created 2014.02.27                            *  
rem *************************************************  
  
rem set environment variables:  
set _devenv="%VS110COMNTOOLS%..\..\Common7\IDE\devenv.com"  
  
rem set compile log  
set _log="%~dp0compileResults.log"  
  
echo [%DATE%-%Time%] Start compile sequence >%_log%  
echo Used compile configuration is %buildAnyCPU% >>%_log%  
  
echo Start compile************************************************  

set _solution_file="%~dp0HelloWorld.sln"

%_devenv% %_solution_file% /build "Debug|Win32" /Out %_log%  
if not %errorlevel% == 0 echo %_solution_file% failed!   Error: %errorlevel% >>%_log%  
if %errorlevel% == 0 echo %_solution_file% compiled successful >>%_log%  
  
rem If compile failed stop processing:  
if not %errorlevel% == 0 pause  
  
echo [%DATE%-%Time%] Finished compile sequence >>%_log%  
  
md Output
echo f | xcopy Debug\HelloWorld.exe Output\Demo[%date:~0,4%_%date:~5,2%_%date:~8,2%][%time:~0,2%_%time:~3,2%].exe /Y/S/H/D


rem pause       