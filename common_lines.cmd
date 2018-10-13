@Echo Off
Set File1=%1
Set File2=%2
If Not Exist "%File1%" (
	Goto :ERROR1
)
if not exist "%file2%" (
	Goto :ERROR2
)

:: This will read the first file into an array of variables and populate it 
setlocal EnableExtensions EnableDelayedExpansion
For /F "Delims=" %%A In ('Type "%File1%"') Do (
	Set /A Count1+=1
	Set "Line1[!Count1!]=%%A"
)
:: This will read the second file into an array of variables and populate it 
For /F "Delims=" %%A In ('Type "%File2%"') Do (
	Set /A Count2+=1
	Set "Line2[!Count2!]=%%A"
)

:: Display common elements of the arrays
For /L %%I In (1,1,%Count1%) Do (
	For /L %%J In (1,1,%Count2%) Do (
		If "!Line1[%%I]!"=="!Line2[%%J]!" (
			Echo "!Line1[%%I]!"
		)
	)
)

Exit /B

::***************************************************
:ERROR1
Echo "  The file "%File1%" does not exist !"
Goto :ERREXIT
:ERROR2
Echo "  The file "%File2%" does not exist !"
Goto :ERREXIT
:ERREXIT
Exit /B
::***************************************************
