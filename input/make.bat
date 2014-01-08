@echo off
set gen=markdown -o "../output/"
set postprocess=ruby postprocessor.rb
set open="../output/index.html"

if "%1"=="all" goto all
if "%1"=="gen" goto gen
goto gen

:all
%gen% & %postprocess% & %open%

:gen
%gen% & %postprocess%