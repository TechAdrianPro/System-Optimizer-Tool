@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title 🚀 Narzędzie Optymalizacji Systemu 🚀 | 🚀 System Optimization Tool 🚀

:: Wybór języka | Language selection
echo 🎯 Wybierz język: (1) Polski (2) English | 🎯 Choose language: (1) Polish (2) English
set /p languageChoice="Wpisz 1 lub 2: | Enter 1 or 2: "

if "%languageChoice%"=="1" (
    set lang=pl
) else (
    set lang=en
)

:: Funkcje w zależności od języka | Language-based messages
if "%lang%"=="pl" (
    set welcomeMsg=🔧 Optymalizacja systemu Windows
    set backupMsg=🔐 Tworzenie kopii zapasowej rejestru...
    set backupDone=✅ Kopia zapasowa rejestru utworzona
    set tempDelMsg=🧹 Usuwanie plików tymczasowych...
    set tempDone=✅ Pliki tymczasowe usunięte
    set serviceMsg=⚙️ Wyłączanie zbędnych usług...
    set serviceDone=✅ Zbędne usługi wyłączone
    set defragMsg=💾 Optymalizacja dysku...
    set defragDone=✅ Dysk zoptymalizowany
    set ramMsg=🔄 Czyszczenie pamięci RAM...
    set ramDone=✅ Pamięć RAM odświeżona
    set networkMsg=🌍 Optymalizacja sieci...
    set networkDone=✅ Sieć zoptymalizowana
    set startupMsg=⚡ Optymalizacja autostartu...
    set startupDone=✅ Autostart zoptymalizowany
    set scanMsg=🎯 Uruchamianie narzędzia do skanowania...
    set scanDone=✅ Skanowanie zakończone
    set creatorMsg=📝 Skrypt stworzony przez TechAdix
    set finishMsg=🎉 Optymalizacja zakończona!
    set versionMsg=🛠️ Wersja: 1.0
    set confirmYes=tak
    set confirmNo=nie
    set cancelMsg=❌ Anulowano operację.
) else (
    set welcomeMsg=🔧 Windows System Optimization
    set backupMsg=🔐 Creating registry backup...
    set backupDone=✅ Registry backup created
    set tempDelMsg=🧹 Deleting temporary files...
    set tempDone=✅ Temporary files deleted
    set serviceMsg=⚙️ Disabling unnecessary services...
    set serviceDone=✅ Unnecessary services disabled
    set defragMsg=💾 Optimizing disk...
    set defragDone=✅ Disk optimized
    set ramMsg=🔄 Clearing RAM...
    set ramDone=✅ RAM refreshed
    set networkMsg=🌍 Optimizing network...
    set networkDone=✅ Network optimized
    set startupMsg=⚡ Optimizing startup...
    set startupDone=✅ Startup optimized
    set scanMsg=🎯 Launching scanning tool...
    set scanDone=✅ Scanning completed
    set creatorMsg=📝 Script created by TechAdix
    set finishMsg=🎉 Optimization completed!
    set versionMsg=🛠️ Version: 1.0
    set confirmYes=yes
    set confirmNo=no
    set cancelMsg=❌ Operation canceled.
)

echo %welcomeMsg%

:: Tworzenie kopii zapasowej rejestru | Creating registry backup
echo %backupMsg%
set backupRegFile=%USERPROFILE%\Desktop\backupReg.reg
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" "%backupRegFile%" >nul 2>&1
echo %backupDone%: %backupRegFile%

:: Czyszczenie plików tymczasowych | Deleting temporary files
echo %tempDelMsg% (%confirmYes%/%confirmNo%)
set /p confirmDelete="> "
if /i "%confirmDelete%"=="%confirmYes%" (
    del /s /q "%temp%\*.*" >nul 2>&1
    del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
    del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
    del /s /q "%AppData%\Local\Temp\*.*" >nul 2>&1
    echo %tempDone%
) else (
    echo %cancelMsg%
)

:: Wyłączanie zbędnych usług | Disabling unnecessary services
echo %serviceMsg% (%confirmYes%/%confirmNo%)
set /p confirmServices="> "
if /i "%confirmServices%"=="%confirmYes%" (
    sc config DiagTrack start= disabled >nul 2>&1
    sc config diagnosticshub.standardcollector.service start= disabled >nul 2>&1
    sc config SysMain start= disabled >nul 2>&1
    echo %serviceDone%
) else (
    echo %cancelMsg%
)

:: Optymalizacja dysku | Optimizing disk
echo %defragMsg% (%confirmYes%/%confirmNo%)
set /p confirmDefrag="> "
if /i "%confirmDefrag%"=="%confirmYes%" (
    defrag C: /O >nul 2>&1
    echo %defragDone%
) else (
    echo %cancelMsg%
)

:: Czyszczenie pamięci RAM | Clearing RAM
echo %ramMsg% (%confirmYes%/%confirmNo%)
set /p confirmRAM="> "
if /i "%confirmRAM%"=="%confirmYes%" (
    wmic process where name="explorer.exe" call terminate >nul 2>&1
    start explorer.exe
    echo %ramDone%
) else (
    echo %cancelMsg%
)

:: Optymalizacja sieci | Optimizing network
echo %networkMsg% (%confirmYes%/%confirmNo%)
set /p confirmNetwork="> "
if /i "%confirmNetwork%"=="%confirmYes%" (
    netsh int tcp set global autotuninglevel=normal >nul 2>&1
    netsh int ip reset >nul 2>&1
    ipconfig /flushdns >nul 2>&1
    echo %networkDone%
) else (
    echo %cancelMsg%
)

:: Optymalizacja autostartu | Optimizing startup
echo %startupMsg% (%confirmYes%/%confirmNo%)
set /p confirmStartup="> "
if /i "%confirmStartup%"=="%confirmYes%" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Cortana /t REG_SZ /d "" /f >nul 2>&1
    echo %startupDone%
) else (
    echo %cancelMsg%
)

:: Uruchomienie narzędzia do skanowania | Launching scanning tool
echo %scanMsg% (%confirmYes%/%confirmNo%)
set /p choice="> "
if /i "%choice%"=="%confirmYes%" (
    start /wait mrt.exe
    echo %scanDone%
) else (
    echo %cancelMsg%
)

:: Podsumowanie | Summary
echo %finishMsg%
echo.
echo %creatorMsg%
echo %versionMsg%
echo.
pause
exit
