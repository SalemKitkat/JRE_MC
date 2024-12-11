@Echo off
SetLocal EnableExtensions EnableDelayedExpansion
If "%1"=="" Goto Relay

:Start
If Exist Peridot-Relay.txt (
	Set /P serverJar=<Peridot-Relay.txt
	"C:\Program Files\Java\jre1.8.0_431\bin\java.exe" -Xms6G -Xmx6G -jar %serverJar% nogui
) Else (
	"C:\Program Files\Java\jre1.8.0_431\bin\java.exe" -Xms10G -Xmx10G -jar %1 nogui
)
Goto Start

:Relay
If Exist Peridot-Relay.txt (
	Goto Start
) Else (
	Echo No server jar was specified in an argument, setting variable now...
	Set /P jarFile="What is the name of the server's jar file? "
	Echo !jarFile!>>"Peridot-Relay.txt"
)
