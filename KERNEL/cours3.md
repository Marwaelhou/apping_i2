* @file cours3.md
* @author Rod Guillaume
* @date 21 Nov 2018
* @copyright 2018 Rod Guillaume
* @brief

# Retour sur Memory Manager

Quand on set les %cs, %ss etc.

On met l'index de l'entree de la GDT auquel correspond le segment pour dire
kernel code, kernel data...

Y'a 2 entrees qui nous sont utiles au debut. les 2 kernel.

* ds c'est la data, donc 0x10
* cs c'est le kernel code, donc 0x8

init GDT (limit a FFFFFF)
load GDT (on donne au processeur)
active mode protected
ensuite on charge les segment selectors CS (et ds)
La t'es vraiment en mode protege

e, f et g c'est pas utilise tout de suite. c'est surtout cs et ds.

# capture des events materiels et logiciels du cpu

On veut associer ce qu'il se passe dans la machine aux handlers.

C'est ca la gestion des interruption et exception

**exception** = erreur issues du CPU qui sont synchrones quand on execute du code
(segfault, divided by 0)

**interruption** = provient du materiel (ext au cpu) et les syscalls.

# IDT Interrupt Descriptor Table

Y'a les 256 entrees pour les interruptions

## Entrees de l'IDT

Task Gate, Interrupt Gate, Trap Gate

Dedans on stocke un pointeur de fonction, qui sera appele quand y'a
l'interruption.

Pour l'instant, on a juste les interrupt et les trap gates.

## Difference interrupt et trap

Le CPU est en ecoute des interruptions.

trap gate = quand on traite une interruption, on ecoute plus les autres.

P = 1 pour dire entree valide
Selector = 1 shifted de 3 bits donc 8 pour dire kernel code
D = taille de la gate, on dit 32 bits donc on met a 1.

`cli` et `sti` permettent d'activer ou non l'ecoute des interruptions. C'est
pour creer des blocs critiques qu'on veut pas interrompre.

Pour les interruptions (materiel), on communique avec le `PIC`.

# ISR

On sauve cs, eip.
soit on push les registres, soit on utilise `pusha` qui push tous les registres.

on `popa` pour recuperer tous les registres, ou pop pop pop pop pour les
recuperer un a un.

> Le push 0x0, c'est juste parce que dans le cas ou y'a une erreur y'a un push
> implicite avant d'entrer dans la fonction. Dans le cas ou y'a pas d'erreur on
> met un 0 histoire d'aligner et pouvoir utiliser la meme fonction apres (on pop
> 2 fois dans tous les cas)

Le `add $8, %esp`

push esp c'est pour sauvegarder l'etat actuel de ma pile.

```asm
push %eax
push %ebx
```

```c
// la struct permet de decoder ce qu'il y a sur la pile
struct state_register {
  int esp;
  int ebx; // c'est l'ordre inverse de ce qu'on a push !
  int eax;
  ...
  int nb_int; // le push 33 dans la slide 11
  int error; // le push 0 (slide 11)
};

// ctx = esp. c'est son adresse
// la structure decrit ce qu'on a sur la pile
void generic_c_handler(struct state_register *ctx) {
  if (ctx->nb_int < 32) {
    // exception
    printf("%s\n", except[ctx->nb_int]);
  } else {
    // ...
  }
}
```

Ordre du `pusha` pour pouvoir le mettre dans le bon ordre dans la struct ctx:
http://faydoc.tripod.com/cpu/pusha.htm

# PIC, les interruptions materielles

16 IRQ.

Le slave forward l'interruption au port 2 du master ensuite.
Donc le master doit gerer ca quand il recoit du 2.

Chaque IRQ est associe a un materiel.

* IRQ0 c'est PIT, une horloge qui permet d'appeler une fonction tous les x
  temps.
* IRQ1 c'est a chaque appui de touche

Nous on utilise 2 IRQ. Le PIT et le keyboard.

## Programmer le PIC

Faut lui balancer une sequence d'instructions pour le programmer.

Y'a des adresses de port, donc `outb` !

On commence sur le port A pour init une sequence et ensuite ca se passe sur le
port B.

```asm

icw1 sur port A
icw2 sur port B ; icw ca map a quelle entree IDT correspond IRQ

```

Comme les 32 premieres exceptions sont deja prises, on doit mapper a partir de
32.

D'ou la slide 17, avec `xxxxx000`. Les 3 premiers bits sont reserves.

icw3 c'est pour dire que le IRQ2 est connecte au slave !

icw4 c'est pour dire des parametres. On bufferise ou pas, ou on fait ci, on fait
ca...

End Of Interrupt c'est pour dire au PIC que le CPU a fini quand il a fini.

`icw1-4` on config notre PIC
`ocw1` ca gere le masque associe aux interruptions. Ca dit quelles interruptions
PIC on ecoute sur le CPU.

ocw1 on le balance sur la puce master si ca conincide a ses IRQ et au slave
sinon.

Sur k on aura que PIT et le timer a implementer.

Au depart on masque tout. On veut 0 interruptions.

`ocw2` ca permet de faire un EOI.
