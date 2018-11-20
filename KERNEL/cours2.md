* @file cours2.md
* @author Rod Guillaume
* @date 14 Nov 2018
* @copyright 2018 Rod Guillaume
* @brief Memory Managment

# Questions pour le prof

1. Architecture du projet

Ou mettre mes fichiers ? Dans k/ ? Dans libk/ ? Ailleurs ?

2. `COM1[OFFSET] |= (1UL << 5);` ou `outb(COM + OFFSET, COM[OFFSET] | (1UL << 5))` ?

# GDT (Global Descriptor Table)

C'est la table qui dit que telle plage d'adresse c'est tels droits.

On utilise les *segment descriptor* pour decrire ces plages d'adresses, ces
zones memoire.

On aura Kernel code/data et user code/data.

* Kernel = ring 0
* User = ring 3
* code = executer et lire des data
* data = lire et ecrire mais pas executer

Quand on passe de kernel a user ou inversement, faut changer tous les segment
selectors. Donc on sauve l'etat et mettre d'autres choses.

> CS doit referencer Kernel ou User code en fonction du mode ou on est.
> Sinon ca voudrait dire que user peut acceder a des trucs de kernel, a plus de
> droits et tout.

Donc pour passer d'un mode a l'autre faut juste jouer avec les registres
*segment selectors*.

# GDT structure

Par convention la premiere entree est `NULL`.

cf. les slides pour avoir le mapping des entrees. (slide 7)

# GDT Entry

Pour pas galerer comme un connard, faire la GDT Entry sous forme de bitfield
avec des fonctions qui initialisent. Base @ et l'autre la, ca sera toujours 0 et
-1 apparemment.

DPL = 0 ou 3 selon si t'es kernel ou user.

# Segment selector layout

Table Indicator, nous ca sera toujours GDT. LDT c'est du local machin, on s'en
fout dans notre cas.

> Ex. CS pointe sur KC.
> Tous les autres, SS, DS ES, FS, GS pointent vers KD.

Quand on a mis tous les segment selectors et tout, on passe en *mode protege*.

# CR0

On met un 1 dans le CR0 pour activer le mode protege. On active pas la
pagination ni rien.

**On doit utiliser un registre intermediaire pour ecrire dans cr0**.

# Aller en mode protected mode

> Slide 17

On peut pas changer `ip` direct, comme `cr0`.
L'astuce c'est soit de faire un `lret`, qui va chercher le cs en plus de l'@ de retour.
Ou bien, on utilise un `ljmp`.

Attention. Quand on charge un GDT ET que tu passes en mode protege, le kernel
attend que tu lui files un CS et tout.

C'est un mode intermediaire sinon quand t'as pas encore donne un CS.

T'es vraiment en mode protected quand t'as set le cr0 ET que t'as mis le bon CS.
