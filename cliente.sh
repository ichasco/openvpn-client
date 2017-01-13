#!/bin/bash

cliente=$1

#Crear el archivo de configuracion en base a la plantilla
/bin/cp /etc/openvpn/clientes/template.conf /etc/openvpn/clientes/$cliente.conf

#Ejecutar Variables
/bin/cd /etc/openvpn/easy-rsa/ && source ./vars

#Crear los certificados
/bin/bash /etc/openvpn/easy-rsa/build-key --batch $cliente

#Hacer el inline de los certificados
/bin/echo '<ca>' >> /etc/openvpn/clientes/$cliente.conf
/bin/cat /etc/openvpn/easy-rsa/keys/ca.crt >> /etc/openvpn/clientes/$cliente.conf
/bin/echo '</ca>' >> /etc/openvpn/clientes/$cliente.conf

/bin/echo '<cert>' >> /etc/openvpn/clientes/$cliente.conf
/bin/cat /etc/openvpn/easy-rsa/keys/$cliente.crt >> /etc/openvpn/clientes/$cliente.conf
/bin/echo '</cert>' >> /etc/openvpn/clientes/$cliente.conf

/bin/echo '<key>' >> /etc/openvpn/clientes/$cliente.conf
/bin/cat /etc/openvpn/easy-rsa/keys/$cliente.key >> /etc/openvpn/clientes/$cliente.conf
/bin/echo '</key>' >> /etc/openvpn/clientes/$cliente.conf

/bin/echo 'ifconfig-push IP 255.255.255.0' > /etc/openvpn/clientes/$cliente
