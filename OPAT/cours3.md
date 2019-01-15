<!--
* @file cours3.md
* @author Rod Guillaume
* @date 11 Dec 2018
* @copyright 2018 Rod Guillaume
* @brief <brief>
-->

# Multiplexage en longueur d'onde

Historiquement on avait du optoelectronique, on regenerait le signal (OEO).

OEO: regenerateur qui utilise des repeteurs optoelectronique (debit 500Mbps)

Ensuite arrivent les amplificateurs optiques (forme de triangle sur la slide 4)

# Transmission limitations

La slide 9 parle des differences entre la fibre standard et la non standard.

La standard a pas ete concue en pensant aux irregularites du guide d'onde
(l'interieur du cylindre/fibre).

Donc comme c'est pas parfaitement lisse on a des limitations et au final la
fibre DSF est plus performante que la SMF et dans les transmission
trans-oceaniques on utilise des DSF parce que y'a moins besoin de repeteurs.

Normalisation:

* Systeme WDM = 100 GHz d'espacement entre canaux
* Systeme D(ense)WDM = 50 GHz
* Systeme U(ultra)DWDM = 25 GHz

Dans les liaisons oceaniques on met des fibres DCF de temps en temps entre les
DSF pour recaler.

Si trop de puissance en entree d'un ampli = platitude de la courbe de gain

> Slide 32

C'est du 2.6666 et pas 2.5 a cause des bits de FEC. Ca augmente artificiellement
le debit. C'est juste des bits de controle, comme on connait en reseau normal.

Pre-ampli faible bruit -> c'est juste pour amplifier le signal.
Post ampli c'est un booster pour envoyer un truc plus fort. (a 26dB dans l'exemple).

> Rappel: 25 db = 20 + 6 = 100mW * 4mW = 400mW

Dans les dernieres slides on compare entre du 2.5 et du 10. Donc on perd 30km car on perd 6dB (facteur 4 = 2 * 3dB).
