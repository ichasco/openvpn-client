# openvpn-client
Script para crear certifiados cliente en OpenVPN

Previeamente hay que tener:
Carpeta -> /etc/openvpn/clientes
Una plantilla con la configuración -> /etc/openvpn/clientes/template.conf
Carpeta easy-rsa -> /etc/openvpn/easy-rsa

Para ejecutarlo:

./cliente.sh <nombre_cliente> <IP>

Este script es parte del tutorial: https://blog.ichasco.com/openvpn-instalar-configurar-servidor-vpn/
