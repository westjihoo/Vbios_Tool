@echo off

set uaccheck=0

:CheckUAC
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' ( goto UACAccess ) else ( goto INSTALL )

:UACAccess
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\uac_get_admin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\uac_get_admin.vbs"
"%temp%\uac_get_admin.vbs"
del "%temp%\uac_get_admin.vbs"
exit /b


:INSTALL
pushd %~dp0
cls
@echo ===============================================================
@echo กเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเ
@echo กเกแกแกแกเกเกแกเกเกเกเกแกเกเกแกแกแกแกเกเกแกแกแกแกแกเกเกเกเกแกเกเกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกแกเกเกเกแกเกแกเกเกเกเกเกเกเกเกแกเกเกเกเกเกแกเกแกเกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกแกเกเกเกแกเกแกเกเกเกเกเกเกเกเกแกเกเกเกเกเกแกเกแกเกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกแกเกเกแกเกแกเกเกเกเกเกเกเกเกแกเกเกเกเกเกแกเกแกเกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกแกเกเกแกเกเกแกแกแกแกเกเกเกเกแกเกเกเกเกแกเกเกเกแกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกเกแกเกแกเกเกเกเกเกเกแกเกเกเกแกเกเกเกเกแกแกแกแกแกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกเกแกเกแกเกเกเกเกเกเกแกเกเกเกแกเกเกเกเกแกเกเกเกแกเกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกเกเกแกแกเกเกเกเกเกเกแกเกเกเกแกเกเกเกแกเกเกเกเกเกแกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกเกแกเกเกเกแกเกเกเกแกแกเกเกเกเกเกเกแกเกเกเกแกเกเกเกแกเกเกเกเกเกแกเกแกเกเกเกเกเกแกเกเกเกเกเ
@echo กเกแกแกแกเกเกแกเกเกเกเกแกเกแกแกแกแกแกเกเกเกเกแกเกเกเกแกเกเกเกเกเกแกเกแกแกแกแกแกเกแกแกแกแกแกเ
@echo กเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเกเ
@echo ===============================================================
@echo  วุด็ มฆวฐฟก VBIOSธฆ ผณฤกวีดฯดู.
@echo  น๘ศฃธฆ ผฑลรวฯผผฟไ.
@echo  ( มพทแ = q )
@echo ===============================================================
@echo.

@dir /b *.rom
@echo.

set /p model=[ROM ฦฤภฯธํภป ภิทยวฯผผฟไ.] : 
if "%model%" EQU "q" goto END
if "%model%" EQU "Q" goto END
if "%model%" EQU "" goto INSTALL
if not exist %model% goto INSTALL

:INSTALL2
@echo ===============================================================
@echo  พฦทก ฦฤภฯทฮ พ๗ตฅภฬฦฎ วฯฝรฐฺฝภดฯฑ๎.
@echo  File Name : %model%
@echo  [ Y / N / มพทแ Q ]
@echo ===============================================================
@echo.

set /p check=[ Y / N ] : 

if "%check%" EQU "y" goto FLASH
if "%check%" EQU "Y" goto FLASH
if "%check%" EQU "n" goto INSTALL
if "%check%" EQU "N" goto INSTALL
if "%check%" EQU "q" goto END
if "%check%" EQU "Q" goto END
goto INSTALL2

:FLASH
nvflash64.exe %model%

@echo ===============================================================
@echo  พ๗ตฅภฬฦฎฐก ฟฯทแตวพ๚ฝภดฯดู.
@echo  File Name : %model%
@echo ===============================================================
:END
pause