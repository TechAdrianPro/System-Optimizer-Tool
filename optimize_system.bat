@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title 🚀 Narzędzie Optymalizacji Systemu 🚀

:: Wybór języka
echo 🎯 Wybierz język: (1) Polski (2) English
set /p languageChoice="Wpisz 1 lub 2: "

if "%languageChoice%"=="1" (
    :: Polski
    set lang=pl
) else (
    :: Angielski
    set lang=en
)

:: Funkcje w zależności od języka
if "%lang%"=="pl" (
    set welcomeMsg=Optymalizacja systemu Windows
    set backupMsg=Tworzenie kopii zapasowej rejestru...
    set backupDone=Kopia zapasowa rejestru utworzona
    set tempDelMsg=Usuwanie plików tymczasowych...
    set tempDone=Pliki tymczasowe usunięte
    set serviceMsg=Wyłączanie zbędnych usług...
    set serviceDone=Zbędne usługi wyłączone
    set defragMsg=Optymalizacja dysku...
    set defragDone=Dysk zoptymalizowany
    set ramMsg=Czyszczenie pamięci RAM...
    set ramDone=Pamięć RAM odświeżona
    set networkMsg=Optymalizacja sieci...
    set networkDone=Sieć zoptymalizowana
    set startupMsg=Optymalizacja autostartu...
    set startupDone=Autostart zoptymalizowany
    set scanMsg=Uruchamianie narzędzia do skanowania...
    set scanDone=Skanowanie zakończone
    set creatorMsg=Skrypt stworzony przez TechAdix
    set finishMsg=Optymalizacja zakończona!
    set versionMsg=Wersja: 1.0
) else (
    :: English
    set welcomeMsg=Windows System Optimization
    set backupMsg=Creating registry backup...
    set backupDone=Registry backup created
    set tempDelMsg=Deleting temporary files...
    set tempDone=Temporary files deleted
    set serviceMsg=Disabling unnecessary services...
    set serviceDone=Unnecessary services disabled
    set defragMsg=Optimizing disk...
    set defragDone=Disk optimized
    set ramMsg=Clearing RAM...
    set ramDone=RAM refreshed
    set networkMsg=Optimizing network...
    set networkDone=Network optimized
    set startupMsg=Optimizing startup...
    set startupDone=Startup optimized
    set scanMsg=Launching scanning tool...
    set scanDone=Scanning completed
    set creatorMsg=Script created by TechAdix
    set finishMsg=Optimization completed!
    set versionMsg=Version: 1.0
)

:: Tworzenie kopii zapasowej rejestru przed zmianami
echo 🔐 %backupMsg%
set backupRegFile=%USERPROFILE%\Desktop\backupReg.reg
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" "%backupRegFile%" >nul 2>&1
echo ✅ %backupDone%: %backupRegFile%

:: Potwierdzenie przed czyszczeniem plików tymczasowych
echo 🧹 %tempDelMsg% (tak/nie)
set /p confirmDelete="Wybierz: "
if /i "%confirmDelete%"=="tak" (
    echo Usuwanie plików tymczasowych...
    del /s /q "%temp%\*.*" >nul 2>&1
    del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
    del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
    del /s /q "%AppData%\Local\Temp\*.*" >nul 2>&1
    echo ✅ %tempDone%!
) else (
    echo ❌ Anulowano czyszczenie plików tymczasowych.
)

:: Potwierdzenie przed wyłączaniem usług
echo ⚙️ %serviceMsg% (tak/nie)
set /p confirmServices="Wybierz: "
if /i "%confirmServices%"=="tak" (
    echo 🔧 Wyłączanie zbędnych usług...
    sc config DiagTrack start= disabled >nul 2>&1
    sc config diagnosticshub.standardcollector.service start= disabled >nul 2>&1
    sc config SysMain start= disabled >nul 2>&1
    echo ✅ %serviceDone%!
) else (
    echo ❌ Anulowano wyłączanie usług.
)

:: Potwierdzenie przed optymalizacją dysku
echo 💾 %defragMsg% (tak/nie)
set /p confirmDefrag="Wybierz: "
if /i "%confirmDefrag%"=="tak" (
    echo 💎 Optymalizacja dysku...
    defrag C: /O >nul 2>&1
    echo ✅ %defragDone%!
) else (
    echo ❌ Anulowano optymalizację dysku.
)

:: Potwierdzenie przed czyszczeniem pamięci
echo 🔄 %ramMsg% (tak/nie)
set /p confirmRAM="Wybierz: "
if /i "%confirmRAM%"=="tak" (
    echo 🔄 Czyszczenie pamięci RAM...
    wmic process where name="explorer.exe" call terminate >nul 2>&1
    start explorer.exe
    echo ✅ %ramDone%!
) else (
    echo ❌ Anulowano czyszczenie pamięci RAM.
)

:: Optymalizacja sieci (opcja)
echo 🌍 %networkMsg% (tak/nie)
set /p confirmNetwork="Wybierz: "
if /i "%confirmNetwork%"=="tak" (
    echo 🌐 Optymalizacja sieci...
    netsh int tcp set global autotuninglevel=normal >nul 2>&1
    netsh int ip reset >nul 2>&1
    ipconfig /flushdns >nul 2>&1
    echo ✅ %networkDone%!
) else (
    echo ❌ Anulowano optymalizację sieci.
)

:: Optymalizacja startu systemu (wybór)
echo ⚡ %startupMsg% (tak/nie)
set /p confirmStartup="Wybierz: "
if /i "%confirmStartup%"=="tak" (
    echo ⚙️ Optymalizacja autostartu...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Cortana /t REG_SZ /d "" /f >nul 2>&1
    echo ✅ %startupDone%!
) else (
    echo ❌ Anulowano optymalizację autostartu.
)

:: Uruchomienie MRT (skanowanie)
echo 🎯 %scanMsg% (tak/nie)
set /p choice="Wybierz: "
if /i "%choice%"=="tak" (
    echo 🚨 Uruchamianie narzędzia do skanowania...
    start /wait mrt.exe
    echo ✅ %scanDone%!
)

:: Końcowa wiadomość o twórcy
echo 🎉 %finishMsg%
echo.
echo 📝 %creatorMsg%.
echo 🛠️ %versionMsg%
echo.
pause
exit
