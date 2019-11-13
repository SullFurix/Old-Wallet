@echo off & cls & color 0B
Mode con cols=72 lines=5

:menu
Cls & color 0B
Title Old Wallet
echo.
echo.      ==========================Menu============================
echo.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.           %%B  %%C
echo.
echo.      ==========================================================
set choice=
echo. & set /p choice=The number of your choice and press ENTER: || goto :menu
echo. & call :menu_[%choice%]
goto:menu
::********************************************************************************************
:menu_[1] Add an address
Add an address...
cls & color 0B

set /p cryptoName=Enter the name of the cryptocurrency you want to add:
mkdir "./wallet/%cryptoName%"

set /p cryptoPublic=Enter the public key:
echo.%cryptoPublic%>>./wallet/%cryptoName%/%cryptoName%_public.key

set /p cryptoPrivate=Enter the private key:
echo.%cryptoPrivate%>>./wallet/%cryptoName%/%cryptoName%_private.key

echo Click on a key to return to the menu
pause>nul
goto:menu
::********************************************************************************************

:EOF
EXIT