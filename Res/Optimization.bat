@echo off
echo Создание точки восстановления системы...
powershell.exe -Command "Checkpoint-Computer -Description 'Before Gaming Optimization' -RestorePointType 'Modify_Settings'"

echo Отключение ненужных служб...
sc stop SysMain
sc config SysMain start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop Fax
sc config Fax start= disabled
sc stop Spooler
sc config Spooler start= disabled
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled
sc stop TabletInputService
sc config TabletInputService start= disabled

echo Отключение визуальных эффектов...
reg add "HKCU\Control Panel\Desktop" /v VisualFXSetting /t REG_DWORD /d 2 /f

echo Настройка параметров быстродействия для наилучшего быстродействия...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewWatermark /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d 0 /f

echo Отключение автообновления Windows...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f

echo Отключение уведомлений Центра поддержки...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f

echo Отключение OneDrive...
taskkill /f /im OneDrive.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "" /f
%SystemRoot%\System32\OneDriveSetup.exe /uninstall

echo Настройка максимальной производительности питания...
powercfg -change -monitor-timeout-ac 0
powercfg -change -disk-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
powercfg -setactive SCHEME_MIN

echo Очистка временных файлов...
del /q /f %TEMP%\*
del /q /f %WINDIR%\Temp\*

echo Оптимизация реестра для ускорения работы...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /f



setlocal

REM Путь к исполняемому файлу BoostBeta.exe
set EXE_PATH=%~dp0BoostBeta.exe

REM Добавляем запись в реестр для автозапуска
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v BoostBeta /t REG_SZ /d "%EXE_PATH%" /f

echo BoostBeta добавлен в автозапуск.
pause
endlocal

echo Оптимизация ПК для игр завершена. Перезагрузка компьютера...
shutdown /r /t 0
