<!--
* @file cours5.md
* @author Rod Guillaume
* @date 5 Dec 2018
* @copyright 2018 Rod Guillaume
-->

# Memory Layout

Au boot y'a grub qui creer des trucs et met des infos dans la structure
`multiboot` qu'on a dans `k_main`.

Dans multiboot y'a un element `memory map` qui nous donne des infos sur 'ou
commence la memoire', 'ou la memoire physique se termine' etc.

bss = donnees non initialisees
data = donnees init
rodata = constantes

# WAIT PACKET REQ

* BUSY -> RIEN = 0 / 1 = OCCUPE
* DRQ -> EN COURS = 0 / 1 = FINI

Donc on veut `BUSY = 0 et DRQ = 1`
