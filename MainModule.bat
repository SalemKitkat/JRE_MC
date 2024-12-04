@Echo off
SetLocal EnableExtensions EnableDelayedExpansion

:Startup
mode con: cols=120 lines=25
Cls
Title [JRE-MC] Server Setup Module
:: Prevent an occurance where "echo" may be an executable file on the PATH
If Exist Echo.* (
	Del Echo.* /S /Q >Nul
)
If "!Option!"=="" (
	If "%1"=="test" Goto No_Var
	If "%1"=="" Goto No_Var
	If "%1"=="1.12" Goto 1_12
	If "%1"=="1.16" Goto 1_16
	If "%1"=="1.20" Goto 1_20
	If "%1"=="latest" Goto Latest
)
If "!Option!"=="1.12" Goto 1_12
If "!Option!"=="1.16" Goto 1_16
If "!Option!"=="1.20" Goto 1_20
If "!Option!"=="latest" Goto Latest
:: Exit if for whatever reason, neither of the above variables pass.
Echo Something went wrong! Press any key to exit...
Pause>Nul
Exit

:No_Var
Echo ................................................................................
Echo.
Echo No version was specified! Currently avaliable options are the following:
Echo     - 1.12
Echo     - 1.16
Echo     - 1.20
Echo     - latest
Echo.
Echo ................................................................................
Set /P Option="Which version does the server use?: "
If "!Option!"=="" (
	Echo No version was specified, retrying.
	Goto No_Var
)
If "!Option!"=="1.12" Goto Startup
If "!Option!"=="1.16" Goto Startup
If "!Option!"=="1.20" Goto Startup
If "!Option!"=="latest" Goto Startup
:: Exit if for whatever reason, neither of the above variables pass.
Echo Something went wrong! Press any key to exit...
Pause>Nul
Exit

:1_12
If "%1"=="test" (
	Echo -- Reached 1_12 function successfully.
)
If Not Exist "C:\Program Files\Java\jdk1.8.0_211\bin\java.exe" (
	Echo No JDK/JRE appears to exist for 1.12, Press any key to exit...
	Pause>Nul
	Exit
) Else (
	If Exist Startup.bat (
		Echo.
		Echo Startup file already exists! Would you like to overwrite it? [Y/N]
		Set /P YesNo="[Y/N]? "
		If "!YesNo!"=="" Goto 1_12
		If "!YesNo!"=="Y" Del Startup.bat /S /Q >Nul
		If "!YesNo!"=="N" (
			Echo Startup file not overwritten...press any key to exit.
			Pause>Nul
			Exit
		)
	)
	Echo.
	Echo Downloading 1.12.x startup module...
	curl -o Startup.bat https://raw.githubusercontent.com/SalemKitkat/JRE_MC/refs/heads/main/SubModule/1_12.bat?token=GHSAT0AAAAAACWR7N6PWOVG3IXKGO3726KYZ2QQX4Q
	Echo.
	Echo Startup module pushed to "Startup.bat"
	Echo Press any key to exit...
	Pause>nul
	Exit
)
Exit

:1_16
If "%1"=="test" (
	Echo -- Reached 1_16 function successfully.
)
If Not Exist "C:\Program Files\Java\jre1.8.0_431\bin\java.exe" (
	Echo No JDK/JRE appears to exist for 1.16, Press any key to exit...
	Pause>Nul
	Exit
) Else (
	If Exist Startup.bat (
		Echo.
		Echo Startup file already exists! Would you like to overwrite it? [Y/N]
		Set /P YesNo="[Y/N]? "
		If "!YesNo!"=="" Goto 1_12
		If "!YesNo!"=="Y" Del Startup.bat /S /Q >Nul
		If "!YesNo!"=="N" (
			Echo Startup file not overwritten...press any key to exit.
			Pause>Nul
			Exit
		)
	)
	Echo.
	Echo Downloading 1.16.x startup module...
	curl -o Startup.bat https://raw.githubusercontent.com/SalemKitkat/JRE_MC/refs/heads/main/SubModule/1_16.bat?token=GHSAT0AAAAAACWR7N6ORMTDSK5LPOTPPGKGZ2QQ7MQ
	Echo.
	Echo Startup module pushed to "Startup.bat"
	Echo Press any key to exit...
	Pause>nul
	Exit
)
Exit

:1_20
If "%1"=="test" (
	Echo -- Reached 1_20 function successfully.
)
If Not Exist "C:\Program Files\Java\jdk-17.0.2\bin\java.exe" (
	Echo No JDK/JRE appears to exist for 1.20, Press any key to exit...
	Pause>Nul
	Exit
) Else (
	If Exist Startup.bat (
		Echo.
		Echo Startup file already exists! Would you like to overwrite it? [Y/N]
		Set /P YesNo="[Y/N]? "
		If "!YesNo!"=="" Goto 1_12
		If "!YesNo!"=="Y" Del Startup.bat /S /Q >Nul
		If "!YesNo!"=="N" (
			Echo Startup file not overwritten...press any key to exit.
			Pause>Nul
			Exit
		)
	)
	Echo.
	Echo Downloading 1.20.x startup module...
	curl -o Startup.bat https://raw.githubusercontent.com/SalemKitkat/JRE_MC/refs/heads/main/SubModule/1_20.bat?token=GHSAT0AAAAAACWR7N6PEOPKJ5AESHCRSZ6IZ2QRCIA
	Echo.
	Echo Startup module pushed to "Startup.bat"
	Echo Press any key to exit...
	Pause>Nul
	Exit
)
Exit
)
