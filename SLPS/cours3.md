<!-- /**
* @file cours3.md
* @author Rod Guillaume
* @date 15 Jan 2019
* @copyright 2019 Rod Guillaume
* @brief <brief>
*/ -->

# Developpement

Tous les langages ne se valent pas.

* proche de la machine, gestion memoire
* typage fort, faible
* verifications dynamiques, statiques, aucune
* API mal concue, peu claires

## Liste Noire

Vaut mieux liste blanche, parce qu'en liste noire on oublie toujours des cas !

> Ex. de FB avec les ".exe" qu'on peut douiller avec ".exe "

> Bonnes pratiques slides 3

# Injections SQL (PARTIEL)

* On peut filtrer les donnees pour eviter les quotes.
* Quand y'a pas de quote, on peut carrement injecter plus facilement.

```
WHERE id=-1 UNION SELECT 1, USER()
```
La tu renvoies rien avec leur requete et derriere tu peux SELECT ce que tu veux.

> Slide 7 avec solutions slide 8

# Cross-site Scripting (XSS) - (PARTIEL)

> XXE n'est pas dans le partiel


> Ex balise input avec `id=$id>` et le id GET dans l'url
Donc on peut rajouter une balise script dans l'url

* XSS *reflexif/reflechi* = uniquement pour celui qui a clique sur un URL
  "trafique"

* XSS permanant/stocke = n'importe quel user qui va sur le site aura le XSS.
  * ex du commentaire sur un blog

Pour eviter ca on peut:

* Declarer les cookies en HttpOnly
* Reauthentifier pour les actions sensibles
* utiliser des durees courtes pour les sessions

XSS c'est quoi?

>Quel est la cause de la vulnerabilite aux XSS ?
Le site affiche/reaffiche a l'utilisateur des donnees qui proviennent de
l'utilisateur sans les filtrer.

>Source des injections SQL?
utilisation des donnees utilisateurs sans les filtrer pour faire des request SQL

# Cross Site Request Forgery (CSRF)

Le fait d'avoir un lien qui effectue une action sur le site qui est devinable.
Donc on peut faire cliquer involontairement qqun sur une action.

> Ex. un peu violent: mabanque.com/?dst=RIB&montant=15000042
Si t'envoies ca a qqun bah il fait des virements involontairement

CSRF = forcer un user a effectuer une action
Il veut faire faire a un user une action sur le serveur en tant que user.

> Ex. 2
> Suffit d'aller visiter un site qui fait un POST sur un autre site avec l'url
> de changement de mdp par exemple.

## Comment eviter le CSRF ?

* Demander une action supplementaire quand tu fais une action sensible
  * Genre LinkedIn de se connecter a nouveau quand on modifie le mdp
* Session courte de cookie pour eviter que les sessions restent ouvertes H24

## Les Captcha

Le *t* de captcha c'est Turing ! C'est un test de Turing en fait...

# Injection de commandes systeme

`popen`, `exec`. Quand on utilise ces fonctions sans filtrer on peut y caler des
choses en plus avec `;` a faire executer dans le shell.

Pour eviter ca vaut mieux eviter les fonctions qui executent un shell mais
plutot les methodes qui executent une commande !

Par contre ca protege pas contre l'*injection d'argument* !

# Injection d'argument

Bon la solution c'est de foutre `--` pour arreter le parsing d'args

# Injection de code interprete

On essaie d'executer du code cote server

Donc faut filtrer les entrees etc.

# Directory Transversal

Acceder a des dossiers ou on a pas le droit.

Typiquement tu fais `url/app/../` ou `url/app/%2e%2e/` ou `url/app/%252e%252e`

# Specificites des langages C/C++

## Buffer Overflow

Deborder d'un buffer

Pour eviter ca on peut utiliser des canaris. On l'a vu en securite developpement
l'an dernier. C'est du code random avant le code pour voir si ca a modifie le
code random ou pas quand on return.

## String format bug

```
printf(argv[1])
```

Si on met des "%x" dans la string, ca va aller chercher des arguments en trop
donc potentiellement on peut lire la pile.

## Int Overflow

```
fn (int size)
if (size < 256)
  strcpy(dst, src)
```

si on donne un size negatif ca marche.

Depasser la limite inferieur ou superieur a cause d'une valeur non filtree ou
mal filtree.

Faut donc verifier le min et le max.

## Parsers

On est passe vite sur cette slide.

## Crypto

### Time Based Attack

Quand on verifie un mot de passe en crypto faut quand meme verifier toute la
string parce que sinon ca donne un indice sur le temps d'execution si tu dis
"c'est faux" direct. Genre tu peux savoir quel caractere est faux et tout sinon.

## Compilateurs etc.

Penser a activer les flags de verification et tout et tout.
cf. slides.

# SANS Top 25

* Injection SQL
> Partiel: causes d'une injection sql?
> Input user pas filtres. Donc on fait des request SQL preparees etc.

* Injection commandes systeme
* Buffer overflow
* XSS
* CSRF (action sur serveur en passant par une mule)
* Path transversal
* Injection de code
* Utilisation
