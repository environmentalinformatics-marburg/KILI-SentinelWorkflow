::@echo off
:: enable delayed expansion - used to resolve variable in loop
:: variable has to be used with '!' instead of '%'
setlocal ENABLEDELAYEDEXPANSION

::::::::::::::::::::::::::::::::::::::::::::
:: User Configuration
::::::::::::::::::::::::::::::::::::::::::::

:: Example call for this script
:: sen2cor_test.bat sen2cor_test.xml D:\sentinel\data\l1c D:\sentinel\data\l2a

:: adapt this path to your needs
set gptPath="C:\Program Files\snap\bin\gpt.exe"

::::::::::::::::::::::::::::::::::::::::::::
:: Command line handling
::::::::::::::::::::::::::::::::::::::::::::

:: first parameter is a path to the graph xml
set graphXmlPath=%1

:: second parameter is a path to a parameter file
:: set parameterFilePath=%2

:: use third parameter for path to source products
set sourceDirectory=%2
:: if sourceDirectory ends with '\' remove it
if %sourceDirectory:~-1%==\ set sourceDirectory=%sourceDirectory:~0,-1%

:: use third parameter for path to target products
set targetDirectory=%3
:: if targetDirectory ends with '\' remove it
if %targetDirectory:~-1%==\ set targetDirectory=%targetDirectory:~0,-1%

:: the fourth parameter is a file prefix for the target product name, 
:: typically indicating the type of processing
:: set targetFilePrefix=%5

:: Create the target directory
md %targetDirectory%

::::::::::::::::::::::::::::::::::::::::::::
:: Main processing
::::::::::::::::::::::::::::::::::::::::::::

:: double '%' in batch file and only a single '%' on command line
:: '/D' is for directories like Sentinel data. Remove '/D' when you open files.
for /D /R %sourceDirectory% %%F in (S2A_MSIL1C*.SAFE) do (
  echo .
  :: '~fF' means abolute path of 'F'
  set sourceFile=%%~fF
  echo Processing !sourceFile!
  :: '~nF' means filename without extension of 'F'
  set out=%%~nF
  set outfile=!out:S2A_MSIL1C=S2A_MSIL2A!
  set targetFile=%targetDirectory%\!outfile!.dim
  :: set targetFile=%targetDirectory%\%%~nF.dim
  :: set procCmd=%gptPath% %graphXmlPath% -e -p %parameterFilePath% -t "!targetFile!" "!sourceFile!"
  set procCmd=%gptPath% %graphXmlPath% -e -t "!targetFile!" -Pinfile="!sourceFile!"
  echo !procCmd!
  call !procCmd! 
)
