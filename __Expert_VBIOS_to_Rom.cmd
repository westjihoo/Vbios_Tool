@echo off

set uaccheck=0

:CheckUAC
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' ( goto UACAccess ) else ( goto expert )

:UACAccess
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\uac_get_admin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\uac_get_admin.vbs"
"%temp%\uac_get_admin.vbs"
del "%temp%\uac_get_admin.vbs"
exit /b


:expert
pushd %~dp0
:: ��¥ ���ڿ��� ����Ϸ� ����
set YEAR=%date:~0,4%
set MONTH=%date:~5,2%
set DAY=%date:~8,2%
cls
@echo.
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo ���������������������������������������������
@echo.
@echo  ���� ��ġ�� ROM ����Ʈ�Դϴ�.
@echo  ���ϸ� �ߺ��� �����ϼ���.
@echo.
@dir /b *.rom
@echo.
@echo ===============================================================
@echo  ���� ��ǰ�� VBIOS �� �����մϴ�.
@echo ===============================================================
@echo.


@if exist version.txt del version.txt
@if exist temp.txt del temp.txt

set /p model=[�𵨸��� �Է��ϼ���.] : 

nvflash64.exe --save %model%_VBIOS.rom

ren %model%_VBIOS.rom %model%_VBIOS_%YEAR%%MONTH%%DAY%.rom

@echo ===============================================================
@echo  ������ �Ϸ�Ǿ����ϴ�.
@echo  File Name : %model%_VBIOS_%YEAR%%MONTH%%DAY%.rom
@echo ===============================================================
pause