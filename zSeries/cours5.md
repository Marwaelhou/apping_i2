norme securite EL5+

# PARTIEL semaine prochaine

ILF (le truc pour Linux)
LPAR
Hyperviseur type 1, type
type d'OS géré.

Z est capable de faire tourner que les OS Z vu qu'ils doivent correspondre a
l'architecture Z

RACF = systeme de securite pour les systemes Z (autorisation, etc.)

carte OSA = 3 canaux = write, read, et ?

# Virtualisation avec IBM z

Vocabulaire zVM

CMS a voir.

Le controle des instructions (le flux) ne sera pas au partiel.

Une machine virtuelle, creation et user directory au partiel.

Pour creer un user on edite le fichier **user directory** qui contient toutes
les definitions des users.

Protocole 3215 de zVM: affichage qui se deroule dans une console. (c'est le EGUI
qu'on avait vu)

* Mode CP n'a pas acces aux commandes CMS car couche plus basse.
* Mode CMS a acces aux commandes CMS

Concept de minidisque ou vdisk

Dans User Directory on peut aussi avoir des defintions de *MDISK*.

Chaque user a une liste de ses disques.

Un autre user peut acceder au disque en mode **RR (Read Read)**. Avec LINK.
Sinon apres on peut rajouter des regles en plus.

Link un disque (virtuel)=> liberer on *release*. (CMS)
Pour liberer un disque (un vrai) => Detach (CP donc, car physique)

On modifie user directory. Pour que ces modifications soient prises en compte,
faut que zVM ecrivent ces modifications (ce nouveau User Directory) dans cette
zone de DRCT.

Boot d'un Linux zVM.

CMS boot, CMS charge Linux avec `ipl` et Linux boot.
Sinon ca ecraserait CMS.

CMS c'est un OS.

LINK un disque:

1. On attache un disque (c'est deja fait normalement)
1. `q disk` (query disk) permet de voir tous les disques
1. `access 191 z`
1. `q accessed` la on nous dit qu'on a accede au fichier 191 en mode Z

1. `Filel` file list permet de browser tout ce qu'on a sur un disque

## AUTOLOG1

Machine qui existe en std chez zVM dans lequel y'a un PROFILE EXEC qui permet de
lancer des machines de services (tcp ip).

Dans la console on peut avoir de l'aide pour les commandes CMS, CP et tout.

Pour voir les parametres systemes qui sont set off ou on, on utilise `q(uery)
SET`

## Machine OPERATOR

C'est une machine zVM qui a tous les droits par defaut et qui est cree a la
creation de zOS. Elle recoit tous les messages/notifications systeme.

PROP programmable opeator = permet de definir des regles pour recevoir des
messages.

## Hipersocket

Protocole reseau qui permet de faire parler des partitions entre elles

## RACF

auditing, protection des donnees, ACN
Comme DIRMAINT, c'est une interface qui distribue des taches.

**PARTIEL**, bien connaitre la page **RACF architecture**.
