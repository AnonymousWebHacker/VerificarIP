## Verificar IP

Version: 1.1

Orientado a verificar la conexion de equipos por IP

<p align="center">
<img src="https://github.com/AnonymousWebHacker/VerificarIP/blob/main/demo.webp">
</p>

## COMO USAR

1 - Si es la primera vez que usa scripts powershell, para poder ejecutar scripts necesita darle permiso a PowerShell
Ejecutar PowerShell como administrador y ejecutar

```
Set-ExecutionPolicy Unrestricted
```

2 - Copiar ambas carpetas [`Ping-Host` y `VerificarIP`] en la ruta
```
C:\Program Files (x86)\WindowsPowerShell\Modules\
C:\Program Files \WindowsPowerShell\Modules\
```

3 - Copiar [ lista_servidores.txt ] afuera en C:\
```
C:\lista_servidores.txt

```
4 - Ejecutar
Abrir PowerShell y ejecutar 
```
VerificarIP
```

### CAMBIO DE COLORES
Puede sustituir el color de texto y fondo de las columnas

1 - Abra `VerificarIP.psm1` con un editor de textos y altere los valores en estas opciones

```
# Encabezado	
$color_texto="White"     	#Color Texto de Encabezado
$color_fondo="Black"	 	#Color Fondo de Encabezado

# Color columnas
$color_texto_ok="Green"  	#Color Texto de Correcto
$color_fondo_ok="Black"		#Color Fondo de Correcto
$color_texto_error="Red"	#Color Texto de Error
$color_fondo_error="Black"	#Color Fondo de Error
```

#### Colores permitidos

```
-------------------
# Red   # Rojo   #
# Blue  # Azul   #
# White # Blanco #
# Black # Negro  #
# Green # Verde  #
-------------------
```
