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
