#!/bin/bash

OPENVPN_RSA_DIR=/etc/openvpn/easy-rsa/
OPENVPN_KEYS=$OPENVPN_RSA_DIR/keys

#Introducir el cliente
if [ -z "$1" ]
	then echo -n "Nombre del nuevo cliente (CN): "
	read -e cliente
else
	cliente=$1
fi

#Asegurarse de que no está en blanco
if [ -z "$cliente" ]
	then echo "Introduce el nombre de cliente."
	exit
fi



#Establecer las variables
cd $OPENVPN_RSA_DIR
source ./vars > /dev/null

#Crear el archivo de configuracion en base a la plantilla
/bin/cp /etc/openvpn/clientes/template.conf /etc/openvpn/clientes/$cliente.conf

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
