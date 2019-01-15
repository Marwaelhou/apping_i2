# Ou trouver le TP ?

`/afs/cri.epita.net/resources/teach/networking/gn3`

Il y aura deux fichiers:
* lab.pdf
* install_gns3.sh

# Set les adresses ip

`ip addr ....`
Cette commande n'est pas **persistante**.

Il est conseille d'utiliser le fichier `/etc/network/interfaces`

```
auto ethN
iface a ....
  address
  netmask
  gateway
```

# Config Switch OpenVSwitch

```
ovs-vsctl set port ethN tag=VLAN_ID`
ovs-vsctl set port ethN tag=[]`
ovs-vsctrl list port {ethN}
```

[URL](https://drive.google.com/open?id=1LBS3YRKcTszWn9D5ouEYG_SZ35SDYH9XvCKkSsC6veE)

Command:
```
#ajouter adresse ip :
ip addr add 10.0.1.1/24 dev eth0 (exemple)
#---
ip addr add [ip addr]/[masque] dev [interface réseau]

#lister addresse
ip addr

/etc/network/interfaces ip configuration
```

# host
```
auto eth0
iface eth0 inet static
	address 10.0.2.2
	netmask 255.255.255.0
	gateway 10.0.2.1
---
auto [interface réseau]
iface [interface réseau] inet static
	address [ip addr]
	netmask [masque]
	gateway [routeur ip addr]
```
# router
```
auto eth0
iface eth0 inet static
	address 10.0.2.1
	netmask 255.255.255.0
---
auto [interface réseau]
iface [interface réseau] inet static
	address [ip addr]
	netmask [masque]
```
# Vlan
Sur le switch
```
	ovs-vsctl set port eth0 tag=1
---
	ovs-vsctl set port [interface réseau] tag=[vlan id]
```
# router sub interface
```
auto eth0
iface eth0 inet manual

auto eth0.2
iface eth0.2 inet static
pre-up ip link add name eth0.2 link eth0 type vlan id 2
address 10.0.1.1
netmask 255.255.255.0

---

auto [interface réseau]
iface [interface réseau] inet manual

auto [interface réseau].[vlan id]
iface [interface réseau].[vlan id] inet static
pre-up ip link add name [interface réseau].[vlan id] link [interface réseau] type vlan id [vlan id]
address [ip addr]
netmask [masque]
```

# Commandes Switch en plus (quand on se goure dans les commandes de VLAN)

```
ovs-vsctl set port ethN tag=VLAN_ID
# si tu t’es gouré, tu mets une liste vide en tant que tag :
ovs-vsctl set port ethN tag=[]
# pour voir ce que t’as set :
ovs-vsctrl list port {ethN}
```
