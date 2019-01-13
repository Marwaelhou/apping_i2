<!--
* @file cours1.md
* @author Rod Guillaume
* @date 8 Jan 2019
* @copyright 2019 Rod Guillaume
* @brief <brief>
* -->

# Chapitre Introduction

# Virus / Ver

Ver = exploite les vulnerabilites dans les systemes accessibles ou en brute forcant les mdp

Un ver ca se propage apparemment. J'ai mal ecoute.

# Des exemples

## Les malwares

* cheval de troie: ils interagissent avec l'attaquant
> Certains malwares ne communiquent pas avec l'attaquant. Genre les ransomwares

* virus: soit ils se propagent (des vers), soit non.

> Exemple:
Shamoon en 2012: propagation et effacement du MBR (propagation chez Aramco)

charge/payload = ce que fait le virus

## Le premier virus

En 1989, le virus Maurice.

A l'epoque y'avait pas la RFC 1918 qui donnait des adresses privees, donc on
pouvait se connecter a n'importe quelle machine.

Du coup les pare feu sont arrives.

## Ver Wanacry en 2017

Ver, ransomware.

Particularite de WannaCry.

Ils ont utilise EthernalBlue, recupere de la NASA ou je sais plus qui.

## Ver NotPetya en 2017

Il chiffrait, et il detruisait la cle. Donc pas possible de dechiffrer.
C'est arrive en Ukraine.

C'est tres difficile d'**attribuer** la faute sur un pays. C'est tres facile d'y
glisser des caracteres d'un certain langage, d'utiliser une timezone, etc.

Ils ont utilise une faille dans les logiciels de paie. (**supply chain attack**).

# Exploit Kit

C'est une espece de programme qui regarde les sites et tout et regarde s'ils
sont compatibles a des failles connues puis fourni le code adapte.

## Botnet

On peut faire des DDoS avec des botnets, ou miner des cryptomonnaies.
On peut utiliser un poste contamine pour servir de rebond pour des attaques
Utiliser le botnet pour heberger des sites illegaux.

# Comment le cheval de troie parlait avec l'attaquant ?

A l'epoque ils utilisaient IRC.
Tous les bots etaient sur un channel IRC, et l'attaquant lancait des commandes
sur le channel IRC

D'ou l'expression *botnet*, c'etaient des bots sur IRC.

## Mirai

Botnet qui compromettait des IoT avec mots de passe par defaut ou basique.

Ca servait pour faire des attaques par deni de service, genre OVH s'est fait
attaquer.

Aussi on peut installer un exploit kit sur un site, et tous les gens qui
consultent le site se font contaminer.

Ca s'appelle la technique du **Water Holing**. On compromet un site sur lequel
les gens vont, et si leur navigateur est pas a jour ils se font avoir.

## Computrace

Le concorcium des constructeurs ont mis ca dans les PC (Bios et driver). Ca
permet de localiser et supprimer les donnees de l'ordinateur a distance...

## Exemples de hack de grands sites

* eBay s'est fait peter sa DB en 2014: login, password, mail, etc.
* TV5 Monde
* Banque centrale du Bangladesh en 2016
  * Quand on accede au reseau de la banque on pouvait se connecter au reseau
    SWIFT directement sans login.

# Video exemple

`udevinfo --version`

Quand on connecte un peripherique, apparemment ca passe par udev. Il communique
avec le kernel ou je sais pas quoi.

En gros il exploite une vulnerabilite dans `udev`, qui tourne en root, et donc
on peut lui faire executer des commandes root via la vulnerabilite.

# Elevation locale de privilege

On a un premier compte, et on reusit a elever ses droits pour avoir un compte
administration.

Pour ce faire, faut cibler un programme qui tourne en administrateur, ou des
syscalls qui permettent d'executer en noyau via un programme utilisateur.

# Execution de code a distance

Sans meme avoir de compte, on execute du code a distance.

On peut cibler n'importe quel service qui tourne en reseau:
* pilote TCP/IP
* Serveur Java etc.

Sinon on peut cibler des applications qui tournent sur le PC et qui ouvrent ou
executent des fichiers. Genre un PDF pour cibler Adobe Reader.

# Vulnerabilites

CVE c'est un numero unique, un identifiant, donne a une vulnerabilite.
C'est gere par un truc americain, le MITRE.
C'est recense dans une DB, la NVD.
Le CVE c'est : `CVE-YEAR-NUMERO_CVE`

# Criticite (CVSS)

CVSS = systeme de scoring des CVE
Ca decrit les caracteristiques de la vulnerabilite, et ca lui donne un score.

Le score CVSS permet de:
* avoir une notion de priorite sur quoi fix en premier
* info-gerance:
  * Dans les contrats d'infogerance, on dit que "les CV avec un CVSS de 7"
    devront etre fix dans les 3 jours etc.

# Cout de la vulnerabilite

D'apres le NIST, corriger une vulnerabilite apres avoir ecrit le code coute 30
fois moins cher qu'une fois que le code est deploye.

# Principes generaux

## Surface d'attaque

> Ex: attaque navigateur
> Systeme plugin, gestion fichiers (cache, etc.), parser JS, parser DOM, bibliotheque graphique, cryptographie (TLS, etc.), interface utilisateur

## Defense en profondeur

"Ceinture et bretelles": On a plusieurs systemes de securite, comme ca si on
coupe la "ceinture", on a toujours les autres.

## Principe de moindre privilege / separation des privileges

Attribuer uniquement ce dont a besoin un programme.

Aussi, on donne plusieurs comptes aux gens a haut privilege pour qu'ils soient
pas H24 en root.

## KISS

Rester simple quand on code pour eviter les vulnerabilites

# Analyse de risque

> Exemple de la SGBD et de l'app PHP qui expose la SGBD.

## Que veut-on proteger ?

* mdp utilisateurs
* mdp SQL
* Donnees SQL
* Info personnelles

Du coup, nos **biens supports** a proteger sont le serveur (ou sont l'app et la
DB) et la SGBD (ou sont les donees et les passwords).

## Contraintes legales ?

Selon le secteur y'a des lois a respecter.

## Criteres de securite

* Confidentialite
  * Les donnees ne sont accessibles en lecture uniquement pour les users
    legitimes.
* Integrite
  * Info ne soit accessible en ecriture que pour les users legitimes
* Disponibilite
  * Acces a l'info (on la compte en general en taux d'indisponibilite)
* (preuve)


Donc selon le besoin faut toujours prioriser selon ces 3 axes:
> Ex. Les notes des eleves
> C + : on veut eviter que n'importe qui voit les notes
> I ++ : on veut pas que l'eleve puisse modifier
> D : 1 semaine

# Scenario de menaces

* decouverte de mdp par essais successifs
* visionnage dans les locaux de l'admin quand celui ci se connecte
* interception du flux de donnees quand l'admin se connecte
* phising ou Xscripting

Le but c'est donc d'examiner les risques sur une application et mettre en place
les mesures sur l'app.

On determine les biens (les donnees) et les biens supports (la ou sont stockers
les db) a proteger.

Pour retenir les criteres de securite y'a DICP (ou CIA)

Enfin y'a les preuves (ou tracabilite).

La tracabilite c'est juste une mesure de qqchose qu'on a implemente pour
verifier que ca s'assure bien que personne n'acceder aux donnees sans qu'il ait
le droit.

Donc elle decoule des 3 premiers, d'ou les () autour d'elle.

# Idee recue Open Source VS Close Source

Y'a autant de bug et de vulnerabilites vu que personne lit le code open source a
la recherche de vulnerabilite a part les gens qui en cherchent pour les
exploiter.

# Securite et gestion de projet

## Les recettes

* Recette fonctionnelle = on s'assure que l'application fait ce qu'on veut
* Recette securite = s'assurer que l'app ne fait pas ce qu'on ne veut pas

## Microsoft

Microsoft SDL = Security Development Lifecycle

Microsoft est l'une des premieres entreprises a mettre la securite dans leur processus de developpement.

1. Ils forment leurs dev aux questions de securite
2. exigences
    1. besoins de securite
    1. analyse des risques
    1. bug tracker
3. implementation
    1. documentation
    1. outils
    1. analyse
