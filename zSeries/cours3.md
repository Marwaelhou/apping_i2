* @file cours3.md
* @author Rod Guillaume
* @date 19 Nov 2018
* @copyright 2018 Rod Guillaume
* @brief security
* @contact Jacky.marcisz@fr.ibm.com

L'interface dans le terminal c'est TSO. (Time Sharing Option)

CS390 (Communication Server), c'est la stack TCP/IP de IBM. Avant c'etait SNA,
y'a encore quelques clients qui ont SNA mais bon on sait que TCP/IP a largement
gagné.

CPACF = circuit hardware qui se charge du chiffrement symetrique.
CEXn (CEX6) = circuit qui traite les algo asymetrique.

Avant c'etait directement sur le processeur, maintenant c'est directement une
carte externe. Ca permet d'update les circuits plus facilement.

APF = Authorized Program Facility
Si ton programme n'est pas dans une librarie autorisee il peut pas utiliser les
instructions speciales.

LNKLST c'est l'equivalent du PATH dans Linux/Windows. Tu mets les libs
autorisees dedans.

# PARTIEL

5-6 questions sur la securite, donc relire les slides histoire de connaitre les
grandes lignes.
