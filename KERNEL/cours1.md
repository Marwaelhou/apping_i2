* @file cours1.md
* @author Rod Guillaume
* @date 7 Nov 2018
* @copyright 2018 Rod Guillaume
* @brief
* @URL_PROJET `git@github.com:lse/k.git`
* @URL_COURS  https://k.lse.epita.fr/

# Dependencies

En plus des dependances decrites dans le repo git, j'ai du rajouter aussi:

`mtools, xoriso`

# Lancement du k.iso

`qemu-system-i38 -cdrom k.iso`
`du -h k.iso`

# Fonctionnement du kernel

crt0.S appelle k_main un main normal comme chez tous les autres kernel.

Parce que le main des kernel classiques c'est en userland. Nous c'est en kernel
land.

grub charge un kernel et lui file un initramfs, cad un parametre qui contient n
lein vers l'unite de stockage qui est un fs qui contient des scripts, des
programmes qui vont lui permettre de charger de switcher du kernel mode au user
mode (root) et commencer a executer des scripts pour pouvoir mettre en place
tous les services du systeme d'exploitation.

Dans Linux, on boot en kernel et a la fin du kernel au lieu de chercher sur
initramfs /init/bin/init et de l'executer en user land (root).

En K on fera pas ca. On recoit les infos multiboot_info_t*, on recoit les infos
pour acceder a la ROM.

Le menu au debut du lancement du K, c'est justement un menu qui donne le bon
pointeur info avec le chemin vers la ROM du jeu etc.

# k_main()

le pointeur `fb` qui est un pointeur sur une @ constante, ca permet d'ecrire un
caractere a l'ecran. (le slash qui tourne (star[])).

C'est une facon d'acceder a un peripherique l'adresse fb la. C'est l'adresse
d'un registre IOMAP ou je sais pas quoi.

`0xb8000` c'est la console (caractere)
`0xb0A000` c'est l'ecran

Chaque caractere, c'est une matrice lineaire (un buffer).

Un caractere = la valeur du caractere + un attribut (16 bits en tout donc)

x = colonne (x va de 0 a w)
y = nb de ligne

w = taille en largeur du caractere

$$[(x * 2) + (w * (y * 2)]$$

Donc bref, la console c'est une MATRICE sur UN buffer.
donc le : `*fb = star[u++ % 4]` c'est pour toucher au 1er caractere.

La par defaut la console c'est 80x25.

caractere sur 8 bits, et attribut sur 8 bits (attribut c'est la font, la couleur
etc.).

# Rappels SYS2 et ASSEMBLEUR

BP = base pointer = haut de la stack qui permet d'acceder aux variables locales
ou arguments.

SI/DI = dst/source index

Tous les registres d'@ marchent avec des segments pour pouvoir etre en 16bits.

DPL (privilege level) sur 2 bits car intel a prevu 4 niveaux de privilege.
Nous osef on aura Kernel en 0, et applicatif en 3.

call il jump et sauve eip avant (push + jmp)
jump il y va direct sans rien save

`movl SRC DST`

|||
|---|---|
|+8|@ret
|+12|EBP - caller
||ESP, *on pointe la*

output/input c'est le link entre les varaibles ASM et C.

# clobbered ?

C'est juste pour que le C derriere il sauve bien les registres et les restaure
apres les appels inline de ASM.

# inb/outb

%0 et %1 ce sont des placeholders

`=` = modifie
`&` = adresse

# peripheriques

Le `0xb8000` la c'est juste pour que le bus d'adresse sache que si t'envoies
dans cette @, bah c'est pour le peripherique.

En gros c'est ca les `PortIO`. C'est une convention qui dit "tel peripherique =
tel "port"".

# bitfields

On va vouloir faire des bitfields. Faudra penser a rajouter l'attribut packed
pour eviter le padding pour s'aligner en memoire.

# COM1

COM1 = `0x3F8`

```c
init = serial(); //

for (int i =0; str[i], ++i) {
  outb(COM1, str[i]);
}
```
# DLAB

7e bit du `LCR`, qui est le **LINE CONTROL** aka **base+3**.

C'est un registre d'adressage, qui permet de remapper les registres.
Genre selon la valeur de DLAB on accede pas au meme endroit.

cf les slides pour voir les registres, les bits et tout et tout.

# Set la vitesse de transmission (bps)

DLL et DLM, sont dans base. Faut les set pour changer la bonne vitesse de
transmission.

Mais pour pouvoir set DLM et DLL, faut deja foutre DLAB a 1, qui est dans base+3
au 7e bit.

# Practical 1

faut ecrire une fonction `init()` puis une fonction `write()`. Si on arrive a
printf avec le `-serial stdio` ca devrait etre bon pour ce tp.
