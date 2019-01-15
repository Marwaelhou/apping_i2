<!-- /**
* @file cours2.md
* @author Rod Guillaume
* @date 8 Jan 2019
* @copyright 2019 Rod Guillaume
* @brief <brief>
*/ -->

# Conception

# Securite par defaut

Tout d'abord, il faut eviter de mettre une configuration par defaut non
securisee car personne la change.

> Exemple du stockage de Windows
Au debut c'etait du hachage LM. C'etait mis en majuscule et la fonction de
hachage etait pas terrible.
Ensuite y'a eu le hachage NT, beaucoup mieux mais ils continuaient de stocker le
LM par soucis de compatibilite avec les anciens windows vu qu'on peut en avoir
sur le reseau.

# Securite par l'obscurite (PARTIEL)

Ca repose sur le fait qu'on ne devoile pas la conception.
On cache l'implementation, le fonctionnement et les caracteristiques.

Il ne faut pas se reposer sur le fait que c'est cache et que donc c'est safe. Il
faut un truc sur, vraiment sur.

## Reverse Engineering software

IDA-Pro, Hex Rays

Tout peut etre reversed engineering. Donc il ne faut surtout pas cacher des
choses dans le code. Ca ne sera jamais cache!

# Top 25 (PARTIEL)

En quoi consiste le principe de securite par obscurite et en quoi c'est pas une
bonne pratique?

# Rappel previously

Avant de commencer un projet on fait analyse de risque (trouver ce qu'il
pourrait mal se passer) et donc prendre les mesures.

On fait une Analyse de Risque a chaque debut de projet ou de nouvelle
fonctionnalite.

Ensuite specification, et les grands principes de securite (donc le securite par
defaut etc.)

# Donnees sensibles

Ce sont les donnees qu'on a identifiee pendant l'analyse de risque qu'on veut
proteger.

# Rappels sur HTTP

* protocole de type texte
* port TCP 80 (HTTP), port TCP 443 (HTTPS)

Pourquoi on retrouve souvent port 8080 alors?

En fait sous UNIX faut etre root pour avoir des ports en dessous de 1024, donc
on utilise souvent 8080.

```
METHODE URI VERSON_HTTP
Host: www.google.fr # Ca permet au VHost de resoudre le truc vu que le DNS fout une @IP
User-Argent: # pour adapter la page selon le browser

BODY

```

# SOP - Same Origin Policy

Une page ne pourra faire des requetes AJAX que vers elle meme.

origine = protocole, port, hote

Evidemment, pas de SOP pour des liens sinon tu t'en sors plus.
Les redirections aussi aussi c'est OK.

En gros c'est pour eviter qu'un site accede aux donnees des autres applications.

Donc les API ont un CORS avec les domaines qui ont le droit d'acceder a nous.

Donc si c'est public tu mets CORS = \*. Sinon tu mets CORS = 'mydomain.fr'

# Exemple caramail

Formulaire avec password et login en clair avec SSL. Donc dans tous les cas les
ID sont envoyes en clair et apres c'est en SSL....

# Man in the middle

## LAN

* ARP Cache poisoning
  * on change la table ARP pour se mettre avec la bonne IP pour spoof
* Rogue DHCP
  * on fait genre on est DHCP pour chopper les IP
* Spanning Tree Protocol
  * Y'a pas de TTL dans les trames ethernet donc les trames sont renvoyees a vie
  * du coup on dit au switch vers STP que t'es le nouveau truc par defaut
* Flood switch
  * pour passer en mode hub
* Wi-Fi

## Acces (FAI)

* Tu passes par leur materiel donc ils peuvent tout voir
* Passerelle (compromet routeur sur internet)
* annonces RIP, etc.
  * C'est pour dire au niveau infra que t'es le nouveau passage par defaut etc.

## Internet

Tu peux egalement compromettre des routeurs sur internet pour changer les
routes.

# Hachage, Chiffrement,

Hachage = pas de cle, a sens unique
Chiffrement = cle, dans les deux sens
Encodage = chiffrement mais sans cle. tout le monde peut decoder.

## Hachage

Algorithme de compression avec perte.

* Sens unique
  * Resistance a la pré-image. On peut pas retrouver le texte avec le hash
* Sortie "unique"
  * On veut une sortie unique mais c'est jamais atteignable
* Rapide a executer

C'est jamais "sortie unique" vu que la taille est fixe a la fin vu qu'on a une
entree infinie.

Y'aura forcement des collisions, mais faut pas que quelqu'un soit capable d'en
trouver.

> On a trouve des collisions pour MD5 et SHA1
> Actuellement la puissance de calcul max c'est 2^60 apparemment

Pourquoi on veut pas de collision ?

Si y'a une collision ca veut dire qu'on peut hacher un fichier, l'envoyer, puis
le modifier et dire que c'est toujours le meme vu que c'est le meme hash.

## Chiffrement

Symetrique = meme cle pour chiffrer et dechiffrer

Deux types:
* Par flot (A5/1)
  * c'est utilise dans les conversations telephoniques et tout vu qu'on connait
    pas la taille.
* Par bloc (AES)

Asymetrique = 2 cles.

Cle privee et cle publique.
L'une sert a chiffrer, l'autre a dechiffrer.

> Exemple de discussion chiffre entre A et B en utilisant symetrique +
> Asymetrique

On essaie de passaer en symetrique parce que asymetrique c'est trop lent sinon.

# Signature - Principe

On chiffre avec sa cle privee, comme ca tout le monde peut dechiffer avec sa cle
publique et on est sur que c'est bien nous qui avons signe.

Bon par contre c'est lent de chiffrer en asymetrique donc dans la vraie vie on
fait:

> On chiffre l'empreinte hachage du document et on l'envoie avec le document.
Du coup si on dechiffrer avec la cle publique le hash et que ca correspond,
c'est bon !

# HMAC

On envoie le message + un message secret.

Comme ca si on modifie le message ca modifie le hash vu qu'il a pas la cle K.

C'est pour garder l'integritie du message, tandis que le chiffrement c'est pour garder la Confidentialite.

Avec HMAC le message passe en clair, avec une cle que seul les 2 destinataires
connaissent.

N'assure pas la non repudiation = on ne peut pas savoir qui a envoye le message
(qui l'a ecrit.)

# Protection des donnees sensibles UNIX

* base de comptes :
`/etc/shadow`

* droits sur ce fichier :
root = RW
shadow = R
user = rien

`/usr/bin/passwd` c'est `-rwsr-xr-x`. En gros le 's' la, ca permet de faire un
`setuid` et quand tu executes tu le fais en tant que l'owner, donc root.

Sous Windows t'as un service qui a le droit de faire l'action. Donc tu lui
demandes a lui de changer le mdp et il le fait pour toi.

> Vocabulaire: RPC, LPC = Remote/Local Program Call ?

> Fun Fact: sous Linux y'a un user `games` (uid 5).
> Ca permet de faire un setuid pour le modifier en tant que games pour proteger
> les scores des jeux video

HSM hardware security module = carte crypto dediee a ca avec qui on dialogue
avec le protocole PKCS#11 qui permet de lui demander de chiffrer, de signer,
etc.

# TLS

Cree par NetScape un navigateur.

C'etait SSL puis ca a ete normalise par l'IETF en TLS.

TLS assure le chiffrement, l'authentification du serveur et l'integrite.

TLS ne protege que la transmission des donnees. Pas le stockage.

*cipher suites* bibliotheque d'aglo qu'on peut utiliser.

> Ex slide TLS
> DHE = echange de cle
> RSA = signature, authentification
> AES256 utilise pour chiffrer les communications

# Certificat

Son but c'est de lier une *identite* avec une *cle publique*.

identite: google.com
Validite: 12 mois
Informations de recovation: si ca a ete annule entre temps ou pas
Informations sur le signature: VeriSign, Symantec, Let's Encrypt (certification
gratuite) ... (l'organisme qui signe)
Signature = Hash signe avec la cle privee du signataire

# PKI - Public Key Infrastructure

> Autorite racine

# TLS - Fonctionnement

Client Hello = version TLS et cipher suites
ServerHello = choisit cipher suite
Envoie son certificat
Client envoie sa cle avec la cle publique du certificat
Server dechiffre la cle avec sa private key
Maintenant le server chiffre avec la cle publique qu'il a recu

Ca resiste a un man in the middle passif vu que c'est chiffre l'echange de cle.

S'il est actif et qu'il remplace avec son certificat ca marche pas vu que
l'organisme verificateur ne l'a pas signe.

Probleme: si on trouve la cle du serveur bah on peut tout dechiffrer.

# DHE

Avec DHE on est capable de generer une cle sans la faire transiter sur le
reseau.

Ca regle ce probleme.

DHE seul c'est sensible a man in the middle cat il peut chopper les valeurs donc
si on chiffre les valeurs c'est bon.

# Problemes potentiels

* HTTP vers HTTPS
>Si y'a un man in the middle il peut remplacer les requetes par du HTTP pour pas
passer en HTTPS

* HTTPS vers HTTP
> C'est pas terrible car si c'est sur le meme domaine il enverra le cookie en
> HTTP !

* Pour eviter ce probleme faut declarer les cookies en secure.
* HSTS header c'est pour forcer le navigateur en HTTPS
  * ca permet d'eviter des attaques

> HSTS preload: catalogue que les navigateurs utilisent pour savoir si c'est un
> site qui veut HSTS ou pas.

# Tracabilite

> Def sur slide 27

Ca permet de savoir ce qu'il se passe sur son programme etc.

Genre affaire cablegate de WikiLeaks ou ils ont reussi a chopper 250k
telegrammes diplomatiques sans qu'ils le voient.

# Fonctionnalites dangereuses

Plus y'a de fonctionnalites, plus y'a de surface d'attaque.

> Ex. upload de fichier
> Si on donne un fichier JS ou PHP apres on va dessus dans l'arborescence et bim

# Filtrages (PARTIEL)

Filtrage par liste blanche/noir.

Blanche = on accepte que ce qu'il y a dans la liste.
Noir = on refuse ce qu'il y a.

Vaut mieux une white list.

# Mises a jour (PARTIEL?)

Quand on commence un projet faut penser a comment on le mettra a jour etc.

> Exemple Firefox
> DL maj avec checksum en XML
On verifie le hash.
On execute depuis tmp en tant que user

C'est bien sauf qu'on utilise user pour mettre a jour. Vaut mieux creer un user
Firefox vu qu'il va ecrire dans son reportoire Firefox donc faudra des droits
speciaux.

# Source de donnees

Principe de base: **filtrer toutes les entrees**.

Toujours effectuer des verifications cote serveur. Les verif cote client c'est
juste pour de l'ergonomie.

# Types d'application

## Client lourd

Souvent les mots de passe SQL sont stockes dans l'application lourde, du coup
y'a 1 user SQL et on peut recuperer les mdp.

## Client 3 tiers

App client + serveur + DB

## Client leger

App web + Server Web + DB

# Authentification

Verifier l'identite de la personne.

Elle s'identifie puis on verifie l'authentification.

* secret = mdp
* realiser action = signature cheque, ou appuyer physiquement sur un bouton...
* caracteristique perso = biometrie, etc.
  * defaut: c'est pas revocable. Quand c'est perdu c'est mort.
* possession d'un elt: SMS, mail etc.

auth multi facteur/forte.

forte = multi facteur + robustesse de chaque element

# Principe du defi/reponse

On envoie un defi
Client renvoie la valeur calculee du defi + mot de passe
Serveur peut check le mdp sans que ca circule en clair sur le reseau.

# Mots de passe

> Exemple 1: ils stockent en clair le mdp... faut surtout pas faire ca!

> Exemple 2: Un hacker recupere une DB avec des MD5 de passwords.
Avec ca il peut se creer un dictionnaire de mdp <-> MD5

## Hachage avec du sel

Pour pallier ce pb de mdp en MD5 etc. On peut rajouter du *sel*.
C'est une espece de concatenation entre le mot de passe et le sel de chaque
utilisateur.

Du coup on peut pas recuperer le vrai mdp.

NB: Rainbow tables, dictionnaires
Un dictionnaire c'est juste une liste de mdp
Une rainbow table c'est des associations: password -> md5

## Hacher N fois

Aussi pour allonger le temps de calcul de brute force, on applique N fois les algos de hachage.

> MD5 c'est 1000 fois
> RSA512 c'est 5000 fois

> Joomla concatene le sel et le mdp, c'est pas une bonne facon de faire.
> MD5 FreeBSD ils prennent pas le meme sel a chaque iteration. Genre ils prennent telle substring, puis telle substring, etc.

# Empecher le brute force en ligne

* Bloquer @IP quand trop d'essais
> On ne bloque pas *un compte*, vu que ca permettrait a des gens de bloquer le
> compte d'autres gens en connaissant leur login (tu mets un script qui mets
> n'importe quel mdp pour bloquer le compte)

* voir la slide 42 pour le reste

# Question secrete

C'est tout pourri, faut surtout pas repondre avec une vraie reponse.

C"est stocke en clair, y'a tres peu de possibilites differentes pour chaque
reponse etc.

# Attaque base (passe?) de hash

> Exemple de WordPress en 2007

En gros le token de session c'etait :
```
wordpressuser_MD5URL:login
wordpresspass_MD5URL:MD5(MD5(password))
```

Alors deja le cookie de session est tjr le meme donc on peut *rejouer* les
cookies de session.

Ensuite si on a la rainbow table du site bah on peut creer les tokens de session
si les mdp en base sont stockes en MD5.

# Gestion des droits (Autorisations, Controle d'Acces) (PARTIEL)

> Exemple Numericable
> Tu pouvais acceder a toutes les factures en modifier un lien, suffisait d'etre
> connecte avec son compte et on accedait a tlm.
> Faut donc limiter l'acces pas seulement a l'interface mais bien bloquer tous
> les acces auxquels on a pas le droit

# cryptographie (PARTIEL)

> Ex. de WEP qui a utilise RC4 mais mal. Donc ca avait des faiblesses. Faut bien
> utiliser les algos et les connaitre.

## Attaque downgrade

On demande au serveur un algo de chiffrement tout pourri pour que ce soit plus
simple a peter.

Du coup faut configurer TLS pour refuser les algos pourris.

## Padding Oracle

On fait plein de requetes en misant sur le padding a la fin pour trouver un
caractere a la fois mais bon... c'est rare.

## TL;DR

* Utiliser les algos de crypto existant. Ne pas faire des trucs custom si on y
  connait rien...
* Bien se renseigner sur ses algos
* config TLS pour refuser les algos nuls
* bien gerer les cas d'echec: selon les cas on downgrade ou pas, ca depend du
  besoin.

# Gestion des erreurs

* Verfier les messages d'erreur, ne pas afficher trop d'info
* details erreurs dans les logs pour les devs plutot
* ne pas afficher de donnees sensibles

# SANS Top 25

* Ne pas verifier autorisation pour des trucs critiques
* Verifier une fois les autorisations mais plus apres
  * ex: factures Numericable
* Hardcode les mdp dans code source
  * On peut recuperer le mdp dans le code source
  * On peut pas le modifier vu que c'est dans le code source
* Ne pas chiffrer les donnees sensibles
  * confidentialite
* Upload fichier
  * whitelist d'extensions
* Placer cote client des infos pour faire un controle d'acces
* DL sans verifier integrite
  * faut utilisr un hash ou une signature
* Controle d'acces incorrect (comme les premiers pointes)
* Assignation de permissions pour des donnees critiques (comme au dessus)
* Utiliser un algo de crypto faible ou cassé
  * autant rien mettre
  * Vaut mieux proposer plusieurs algorithmes, (cipher suite) pour permettre de
    changer s'il est faible
* Ne pas restreindre le nb d'essais d'authentification
  * on verrouille l'IP, et pas le compte!
  * captcha
  * on impose aussi une politique de mdp forte pour empecher le brute force
    (classes, nb caracteres...)
* Utiliser du Hash sans sel
  * Pour eviter les attaques par rainbox table
  * On genere 1 sel par utilisateur

# Revisions

> Box Huawei

* Pas de HTTPS donc en clair
* Login et pass dans cookie

> Ex. d'info sensible dans le cas d'un app web
Mot de passe, donnees CB

> Donner un ex pour chiffrer ces donnees
HTTPS

> Bonnes pratiques pour stocker mdp
> Hachage, sel, et algorithme lent (ou iterations) pour ralentir brute force

> 3 criteres pour evaluer les besoins en securite informatique ?
Confidentialite, Disponibilite, Integrite
