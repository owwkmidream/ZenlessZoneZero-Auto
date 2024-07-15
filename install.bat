@echo off
:main
title ZenlessZoneZero-Auto��ݰ�װ�ű�
echo ���Թ���Ա�������
echo ZenlessZoneZero-Auto��ݰ�װ�ű�
echo �ڿ�ʼ��װ֮ǰ����ȷ�����Ķ�readme
pause
echo �Ƿ�װpython3.12.4?(��������и��ڴ˰汾��python����Ҫ��װ������汾����3.10�밲װ���Ͱ汾��ж��)
echo 1.��
echo 2.��
echo ���������ѡ��
set /p ispython=

if "%ispython%"=="1" goto :installpython
if "%ispython%"=="2" goto :whichversion
goto :inputerror1

:installpython
echo ��ʼ��װ��
set url="https://mirrors.huaweicloud.com/python/3.12.4/python-3.12.4-amd64.exe"
set localPath="%temp%\python.exe"

certutil -urlcache -split -f "%url%" "%localPath%"
start /wait "" "%localPath%" /quiet InstallAllUsers=1 PrependPath=1 DefaultAllUsersTargetDir="%ProgramFiles%\Python312"
echo ��װ��ɣ�
echo ����pip��
"%ProgramFiles%\Python312\python" -m pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
"%ProgramFiles%\Python312\Scripts\pip" install setuptools -i https://mirrors.aliyun.com/pypi/simple
"%ProgramFiles%\Python312\Scripts\pip" config set global.index-url https://mirrors.aliyun.com/pypi/simple
pause
goto :whichversion

:whichversion
cls
echo ��鿴readme,��ѡ������Ҫ��װ�İ汾
echo 1.CUDA��CuDNN�����뱾��ĿGPU�汾����
echo 2.����װGPU�汾����
echo 3.����װCPU�汾����
echo ��ѡ��
set /p isversion=
if "%isversion%"=="1" goto :installall
if "%isversion%"=="2" goto :installgpu
if "%isversion%"=="3" goto :installcpu
goto :inputerror2

:installall
echo ��ʼ��װ��
"%ProgramFiles%\Python312\Scripts\pip" install -r %~dp0/requirements-cuda.txt
"%ProgramFiles%\Python312\Scripts\pip" install -r %~dp0/requirements.txt
echo ��װ��ɣ�
goto :end

:installgpu
echo ��ʼ��װ��
"%ProgramFiles%\Python312\Scripts\pip" install -r %~dp0/requirements.txt
echo ��װ��ɣ�
goto :end

:installcpu
echo ��ʼ��װ��
"%ProgramFiles%\Python312\Scripts\pip" install -r %~dp0/requirements-cpu.txt
echo ��װ��ɣ�
goto :end

:inputerror1
echo �����������������
goto :main

:inputerror2
echo �����������������
goto :whichversion

:end
echo ��װ��ɣ�������鿴readme
pause