## VerifyIPs
Version: 1.2

Script PowerShell to Windows.
Oriented to verify the connection of equipment by IP

<p align="center">
<img src="https://github.com/AnonymousWebHacker/VerificarIP/blob/main/demo.webp">
</p>

## COMO USAR

1 - If you are using powershell scripts for the first time, in order to run scripts you need to give PowerShell permission
Run PowerShell as administrator and run

```
Set-ExecutionPolicy Unrestricted
```

2 - Copy both folders [`Ping-Host` and` VerifyIPs`] in the path
```
C:\Program Files (x86)\WindowsPowerShell\Modules\
C:\Program Files \WindowsPowerShell\Modules\
```

3 - Copy [ server.list ] outside on C:\
```
C:\server.list

```
4 - Run
Open PowerShell and run 
```
VerifyIPs
```

### COLOR CHANGE
You can substitute the text and background color of the columns

1 - Open `VerifyIP.psm1` with a text editor and alter the values ​​in these options

```
# Header
$color_texto="White"     	#header text color
$color_fondo="Black"	 	#header background color

# Color columnas
$text_color_ok="Green"  	#Color text column sussefull
$back_color_ok="Black"		#Color background colum sussefull
$text_color_error="Red"	#Color text column error
$back_color_error="Black"	#Color background column error
```

#### Color allows

```
-----------------------------------------
# Red  # Blue   # Green # Black # White #
-----------------------------------------
```
