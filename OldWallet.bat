@echo off & cls & color 0B
Mode con cols=72 lines=12

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
:menu_[2] View a public key
View a public key...
cls & color 0B

dir /b/o:n "./wallet/"

set /p cryptoName=Enter the name of the cryptocurrency:
set publicKey=.\wallet\%cryptoName%\%cryptoName%_public.key
echo Public key of %cryptoName%:
type %publicKey%

echo Click on a key to return to the menu
pause>nul
goto:menu
::********************************************************************************************
:menu_[3] View a private key
View a private key...
cls & color 0B

dir /b/o:n "./wallet/"

set /p cryptoName=Enter the name of the cryptocurrency:
set privateKey=.\wallet\%cryptoName%\%cryptoName%_private.key
echo Private key of %cryptoName%:
type %privateKey%

echo Click on a key to return to the menu
pause>nul
goto:menu
::********************************************************************************************
:menu_[4] View all public keys
View all public keys...
cls & color 0B

for /f "tokens=*" %%c in ('dir /b/o:n "./wallet/"') do echo %%c:&& type ".\wallet\%%c\%%c_public.key"

echo.
echo Click on a key to return to the menu
pause>nul
goto:menu
::********************************************************************************************
:menu_[5] View all private keys
View all private keys...
cls & color 0B

for /f "tokens=*" %%c in ('dir /b/o:n "./wallet/"') do echo %%c:&& type ".\wallet\%%c\%%c_private.key"

echo.
echo Click on a key to return to the menu
pause>nul
goto:menu
::********************************************************************************************
:EOF
EXIT