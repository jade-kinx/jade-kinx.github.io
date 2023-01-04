
@echo off

set "PORT=%1"
if "%PORT%"=="" set "PORT=80"

start python -m mkdocs serve -a localhost:%PORT%

start http://localhost:%PORT%/openstack-docs/
