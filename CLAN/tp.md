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

`ovs-vsctl set port ethN tag=VLAN_ID`
`ovs-vsctl set port ethN tag=[]`
`ovs-vsctrl list port {ethN}`

[URL](https://drive.google.com/open?id=1LBS3YRKcTszWn9D5ouEYG_SZ35SDYH9XvCKkSsC6veE)
