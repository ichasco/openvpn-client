#!/bin/bash

certname=$1

/bin/cp /etc/openvpn/clientes/template.conf /etc/openvpn/clientes/$certname.conf

/bin/bash /etc/openvpn/easy-rsa/build-key --batch $certname

/bin/echo '<ca>' >> /etc/openvpn/clientes/$certname.conf
/bin/cat /etc/openvpn/easy-rsa/keys/ca.crt >> /etc/openvpn/clientes/$certname.conf
/bin/echo '</ca>' >> /etc/openvpn/clientes/$certname.conf

/bin/echo '<cert>' >> /etc/openvpn/clientes/$certname.conf
/bin/cat /etc/openvpn/easy-rsa/keys/$certname.crt >> /etc/openvpn/clientes/$certname.conf
/bin/echo '</cert>' >> /etc/openvpn/clientes/$certname.conf

/bin/echo '<key>' >> /etc/openvpn/clientes/$certname.conf
/bin/cat /etc/openvpn/easy-rsa/keys/$certname.key >> /etc/openvpn/clientes/$certname.conf
/bin/echo '</key>' >> /etc/openvpn/clientes/$certname.conf
