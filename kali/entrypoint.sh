#!/bin/bash

# Asegurar la ruta entre redes si no está ya
ip route | grep -q "192.168.2.0/24" || ip route add 192.168.2.0/24 via 192.168.3.254

# Habilitar reenvío IP
echo 1 > /proc/sys/net/ipv4/ip_forward

# Iniciar servicios necesarios
/etc/init.d/dbus start
/etc/init.d/xrdp start
/etc/init.d/ssh start

# Mostrar mensaje útil
echo "Contenedor Kali iniciado. Usuario: kali / Contraseña: kali"

# Mantener contenedor en ejecución
tail -f /dev/null
