* @file espace_probabilisable.md
* @author Rod Guillaume
* @date 10 Sep 2018
* @copyright 2018 Rod Guillaume
* @brief Probabilités

# Espace probabilisable

## Expérience aléatoire

Une **expérience** est qualifiée d'**aléatoire** si on ne peut prévoir par
avance son résultat, et si répétée dans des conditions identiques, elle peut
donner des résultats différents.

On note $\Omega$ tous les résultats possibles, l'*univers*.

## Événement

Un **événement** est une *proposition logique* relative au résultat de
l'expérience.

> On lance deux dés équilibrés. On peut associer à cette expérience l'univers
> $\Omega$.

$$ \Omega = \{(i, j) | 1 <= i <= 6, 1 <= j <= 6\}$$
$$ card(\Omega) = 6^2 = 36$$
$$ où \ \Omega = \{ 2, ..., 12 \}$$

> Soit un événement A "Somme des points est supérieure ou égale à 10"
> Soit C l'ensemble des événements.

$\forall A \in C$, on associe $\bar{A}$ le contraire de A.

C est défini par 3 axiomes:
* $\forall A \in C$, $\bar{A} \in C$
* Pour tout ensemble *fini ou dénombrable*, $A_1, A_2, ... \in C$
  * $\bigcup_i A_i \in C$
* $\Omega \in C$

**Rappel**:
I est dénombrable ssi $\exists$ une application $\phi$ bijective:
$$I \rightarrow^{\phi} \mathbb{N} \ où \ F \in \mathbb{N}$$
$$ i \rightarrow \Phi(i)$$

## Espace probabilisable

On appelle **espace probabilisable** le couple $(\Omega, C)$, où $\Omega$ est
l'univers, et C est la tribu des événements.

**Remarque**:
$\emptyset \in C$ et $\bigcap_i A_i \in C$ (intersection dénombrable)
$\Omega \in C \Leftrightarrow \bar{\Omega} \equiv \emptyset \in C$

# Axiomes de kolmogorov

## Loi de probabilité

On appelle probabilité sur $(\Omega, C)$, (ou loi de probabilité) une application:
$$P: C \mapsto [0, 1]$$
$$A \mapsto P(A)$$

telle que:

* $P(\Omega) = 1$
* Pour tout ensemble dénombrable d'événements incompatibles $A_i$
  > $ (A_i \bigcap A_j = \emptyset, i \neq j) $
  > $ P(\bigcup_i A_i) = \sum_i P(A_i)$

## Espace probabilisé

On appelle **espace probabilisé** le triplet $(\Omega, C, P)$.

> probabilisable c'est donc juste tribu et univers, et probabilisé t'as la
> fonction de probabilité en plus.

## Propriétés

1. $P(\bar{A}) = 1 - P(A)$
1. $P(\emptyset) = 0$
1. $P(A) \le P(B)$ si $A \subset C$
1. $P(A \bigcup B) = P(A) + P(B) - P(A \bigcap B)$

# Lois de probabilités conditionnelles (Indépendance)

Soit $B \in C$, $P(B) \neq 0$.

## Probabilité conditionnelle

On appelle **probabilité conditionnelle de A sachant B**:

$$P_B(A) = P(A / B) = \frac{P(A \bigcap B)}{P(B)}$$

**ATTENTION** ne pas confondre $A \bigcap B$ et A sachant B.

## Indépendance

A est **Indépendant** de B si $P_B(A) = P(A) \Leftrightarrow P(A \bigcap B) =
P(A) \times P(B)$

## Formules de BAYES

1. $$ P(B/A) = P_A(B) = \frac{P(A/B) P(B)}{P(A)}$$

> **demo**:
> $P(A/B) = \frac{P(A\bigcap B)}{P(B)}$
> $P(B/A) = \frac{P(B \bigcap A)}{P(A)} = \frac{P(A/B) P(B)}{P(A)}$

Soit $(B_i)$ un système complet d'événements:
$$ B_i \bigcap B_j = \emptyset, i \neq j $$
$$ \cup_i B_i = \Omega $$

$$ P(A \cap B_i) = P(A/B_i)(B_i)$$
$$ A = A \cap \Omega = A \cap (\cup_i B_i) = \cup_i(A\cap B_i)$$
$$ P(A) = \sum_i P(A \cap B_i) = \sum_i P_{B_i}(A) P(B_i)$$

2. $$P_A(B_i) = \frac{P_{B_i}(A) P(B_i)}{\sum_iP_{B_i}(A)P(B_i)}$$

## Exercice 1

> Dans une usines de 3 machines $M_1, M_2, M_3$ fabriquant des boulons
> de meme type.
> $M_1$ sort en moyenne 0,3% de boulons defectueux.
> $M_2$ sort en moyenne 0,8% de boulons defectueux.
> $M_3$ sort en moyenne 1% de boulons defectueux.

> On mélange 1000 boulons dans une caisse. 500 de $M_1$, 350 de $M_2$ et 150 de
> $M_3$.
> On tire un boulon au hasard dans la caisse et il est defectueux. Quelle est la
> probabilité qu'il ait ete fabrique par M1, M2 et M3 ?

Soit D "boulon defectueux".
On cherche $P_D(M1)$

On connait:

$P_{M_1}(D) = 0,3\%$
$P_{M_2}(D) = 0,8\%$
$P_{M_3}(D) = 1\%$

$$P_D(M1) = \frac{P_{M_1}(D) P(M_1)}{P(D)}$$

$$ D = (D \cap M_1) \cup (D \cap M_2) \cup (D \cap M_3)$$
$$ P(D) = P(D \cap M_1) + P(D \cap M_2) + P(D \cap M_3)$$
$$ P(D) = P_{M_1}(D) P(M_1) + P_{M_2}(D)P(M_2) + P_{M_3}(D) P(M_3)$$

> Ils sont indépendants donc on peut sommer direct

$$ P_D(M_1) = \frac{P_{M_1}(D)P(M_1)}{\sum^3_{i = 1}P_{M_i}(D)P(M_i)} \approx 0,26 = 26 \% $$

$$ P_D(M_2) = \frac{P_{M_2}(D)P(M_2)}{\sum^3_{i = 2}P_{M_i}(D)P(M_i)} \approx 0,48 = 26 \% $$

$$ P_D(M_3) = \frac{P_{M_3}(D)P(M_3)}{\sum^3_{i = 3}P_{M_i}(D)P(M_i)} = 1 - 0,26 - 0,48 = 0,26 = 26 \%$$

## Exercice 2

> La proportion de pièces défectueuses dans un lot de pièces est 5\%.
> Le contrôle de fabrication des pièces est tel que:
> * si la pièce est bonne, elle est acceptée avec la probabilité 96\%
> * si la piece est mauvaise, elle est refusée avec la probabilité 98\%
> On choisit une pièce au hasard et on la contrôle.
> 1. Quelle est la probabilité qu'il y ait une erreur de contrôle ?
> 1. Quelle est la probabilité qu'une piece acceptée soit mauvaise ?

On note B "la pièce est bonne"
On note A "la pièce est acceptée"
On note E "erreur de contrôle"

$P(B) = 95\%$
$P_B(A) = 96\%$
$P_{\bar{B}}(\bar{A}) = 98\%$

$$E = (B \cap \bar{A}) \cup (\bar{B} \cap A)$$
$P(E) = P(B \cap \bar{A}) + P(\bar{B} \cap A)$ car événements incompatibles.
$$P(E) = P_B(\bar{A}) P(B) + P_{\bar{B}}(A) P(\bar{B})$$
$$P(E) = 0,04 \times 0,95 + 0,02 \times 0,05 = 3,9\%$$

On cherche maintenqnt $P_A(\bar{B})$

$$ P_A(\bar{B}) = \frac{P_{\bar{B}}(A) \times P(\bar{B})}{P(A)} $$

$$ A = (A \cap B) \cup (A \cap \bar{B}) $$
$$ P(A) = P(A \cap B) + P(A \cap \bar{B}) $$
$$ P(A) = P_B(A) P(B) + P_{\bar{B}}(A) P(\bar{B}) = 0,96 \times 0,95 + 0,02 \times 0,05$$

$$ P_A(\bar{B}) = \frac{0,02 \times 0,05}{0.96 \times 0,95 + 0,02 \times 0,05} = 0,001 $$

## Exercice 3

> On dispose de 2 dés A et B.
> Le dé A a 4 faces rouges et 2 blanches.
> Le dé B a 2 faces rouges et 4 blanches.
> On lance une pièce de monnaie telle que la probabilité d'obtenir pile soit $\frac{1}{3}$
> Si on obtient pile on *decide* de jouer *uniquement* avec A.
> Si on obtient face on *decide* de jouer *uniquement* avec B.
> 1. Calculer la probabilite d'obtenir rouge au 1er coup
> 1. On a obtenu rouge aux deux premiers coups, calculer la probabilite d'obtenir rouge au 3e coup
> 1. On a obtenu rouge aux premiers n coups ($ n \in \mathbb{N}^{*}$)
    Determiner la proba d'avoir utilise A. Soit $R_k$ "on obtient rouge au kieme coup"


$P(A) = 1/3$
$P(B) = 2/3$

On cherche *$P(R_1)$*.

$$ R_1 = (R \cap A) \cup (R \cap B)$$
$$ P(R_1) = P(R \cap A) + P(R \cap B)$$
$$ P(R_1) = P_A(R_1) P(A) + P_B(R_1) P(B)$$
$$ P(R_1) = 4/6 \times 1/3 + 2/6 \times 2/3$$
$$ P(R_1) = 4/9$$

On cherche maintenant $P_{R_1 \cap R_2}(R_3)$

$$P_{R_1 \cap R_2}(R_3) = \frac{P(R_1 \cap R_2 \cap R_3)}{P(R_1 \cap R_2)}$$


# Lois discrètes (usuelles)
# Lois continues
