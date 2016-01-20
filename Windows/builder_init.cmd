@echo off
echo Info: Builder Init
set BUILDER_START_DIR=%CD%
rem search for builder custom init
:scan
    if exist Builder goto found
    for %%I in (%CD%) do set __builder_tmp=%%~pI
    if %__builder_tmp% == \ goto not_found
    cd ..
    goto scan
:found

if not exist "Builder\builder_custom_init.cmd" goto not_found

set __builder_tmp=
set BUILDER_TOP_DIR=%CD%

cd Builder
echo Info: Builder running builder_custom_init.cmd
call builder_custom_init.cmd

:not_found
cd %BUILDER_START_DIR%
set __builder_tmp=
echo on
