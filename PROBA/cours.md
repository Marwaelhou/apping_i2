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
1. $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

# Lois de probabilités conditionnelles (Indépendance)

Soit $B \in C$, $P(B) \neq 0$.

## Probabilité conditionnelle

On appelle **probabilité conditionnelle de A sachant B**:

$$P_B(A) = P(A / B) = \frac{P(A \cap B)}{P(B)}$$

**ATTENTION** ne pas confondre $A \cap B$ et A sachant B.

## Indépendance

A est **Indépendant** de B si $P_B(A) = P(A) \Leftrightarrow P(A \cap B) =
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

$$ R_1 \cap R_2 = (R_1 \cap R_2 \cap A) \cup (R_1 \cap R_2 \cap B) $$
$$ P(R_1 \cap R_2) = P(R_1 \cap R_2 \cap A) + P(R_1 \cap R_2 \cap B) $$
$$ = P(R_1 \cap R_2 / A) P(A) + P(R_1 \cap R_2 / B) P(B)$$
$$ = (\frac{4}{6})^2 \times \frac{1}{3} + (\frac{2}{6})^2 \times 2/3 $$
$$ = (\frac{2}{3})^2 \times \frac{1}{3} + (\frac{1}{3})^2 \times \frac{2}{3} $$
$$ P(R_1 \cap R_2) = 4/27 + 2/27 = 2/9  $$

$$ R_1 \cap R_2 \cap R_3 = (R_1 \cap R_2 \cap R_3 \cap A) \cup (R_1 \cap R_2 \cap R_3 \cap B)$$
$$ P(R_1 \cap R_2 \cap R_3) = P(R_1 \cap R_2 \cap R_3 / A) P(A) + (R_1 \cap R_2 \cap R_3 / B) P(B)$$
$$ = (4/6)^3 \times 1/3 + (2/6)^3 \times 2/3$$
$$ = (2/3)^3 \times 1/3 + (1/3)^3 \times 2/3$$
$$ = 8/81 + 2/81 = 10/81 $$

$$P_{R_1 \cap R_2}(R_3) = \frac{10/81}{2/9} = 5/9$$

On cherche maintenant $P_{R_1 \cap R_2 \cap ... \cap R_n}(A)$
$$R_1 \cap R_2 \cap ... \cap R_n = \bigcap_{i = 1}^{n} R_i$$

$$P(A / \bigcap_{i = 1}^{n} R_i) = \frac{P(\bigcap_{i = 1}^{n} R_i / A) P(A)}{P(\bigcap_{i = 1}^{n} R_i)}$$
$$P(\bigcap_{i = 1}^{n} R_i) = P(\bigcap_{i = 1}^{n} R_i / A) P(A) + P(\bigcap_{i = 1}^{n} R_i / B) P(B)$$
$$ = (2/3)^n \times 1/3 + (1/3)^n \times 2/3$$

$$P(A / \bigcap_{i = 1}^{n} R_i) = \frac{(2/3)^n \times 1/3}{(2/3)^n \times 1/3 + (1/3)^n \times 2/3}$$
$$P(A / \bigcap_{i = 1}^{n} R_i) = \frac{2^n}{2^n + 2}$$
$$P(A / \bigcap_{i = 1}^{n} R_i) = \frac{2^{n-1}}{2^{n-1} + 1}$$

## Exercice 4

> On dispose de 2 urnes $U$ et $V$.
> U contient $a$ boules blanches et $b$ boules noires.
> V contient $b$ boules blanches et $a$ boules noires.
> Tous les tirages s'effectuent **avec remise**.
>
> Soient les événements :
> $U_n$ "Le nieme tirage s'effectue dans U"
> $V_n$ "Le nieme tirage s'effectue dans V"
> $B_n$ "La nieme boule tiree est blanche"
>
> Si à l'étape n, on a tiré une boule blanche, le suivant s'effectue dans U, sinon dans V.
>
> 1. Calculer $P(B_{n+1} / B_n) et P(B_{n+1} / \bar{B_n)}$
> 1. On pose $P_n = P(B_n)$, établir la relation de récurrence entre $P_{n+1}$ et $P_n$
> 1. Montre que $P_n \mapsto_{n \mapsto \infty} \frac{1}{2}$

> 1. Calculer $P(B_{n+1} / B_n) et P(B_{n+1} / \bar{B_n)}$

On vient d'avoir $B_n$, donc on tire dans U.

$$P(B_{n+1} / B_n) = \frac{a}{a+b}$$
On vient d'avoir $\bar{B_n}$, donc on tire dans V.
$$P(B_{n+1} / \bar{B_n)} = \frac{b}{a+b}$$

> 2. On pose $P_n = P(B_n)$, établir la relation de récurrence entre $P_{n+1}$ et $P_n$

$$ B_{n+1} = (B_{n+1} \cap B_n) \cup (B_{n+1} \cap \bar{B_n})$$

$$ P(B_{n+1}) = P(B_{n+1} /B_n) P(B_n) + P(B_{n+1} / \bar{B_n}) P(\bar{B_n})$$
$$ P_{n+1} = \frac{a}{a + b} P_n + \frac{b}{a + b} (1 - P_n)$$
$$ P_{n+1} = \frac{a - b}{a + b} P_n + \frac{b}{a + b}$$

> 3. Montre que $P_n \mapsto_{n \mapsto \infty} \frac{1}{2}$

Supposons la suite $(P_n)$ convergente,
Soit $l = \lim_{n \mapsto + \infty} P_n$ (c'est l'équation du point fixe)

$$ l = \frac{a - b}{a + b} l + \frac{b}{a + b}$$
$$ (a+b)l = (a - b) l + b$$
$$ (a+b - a + b)l =  b$$
$$ 2bl = b => l = 1/2$$

Bon, maintenant faut prouver que la suite converge.

Posons $Q_n = P_n - 1/2$

$$P_{n+1} - 1/2 = \frac{a-b}{a+b}P_n + \frac{b}{a+b} - 1/2$$
$$P_{n+1} - 1/2 = \frac{a-b}{a+b}P_n + \frac{b - a}{2(a+b)}$$
$$P_{n+1} - 1/2 = (\frac{a-b}{a+b}) (P_n - 1/2)$$
$$Q_{n+1} = (\frac{a-b}{a+b}) Q_n$$

$Q_n$ est une suite géométrique de raison $q = \frac{a-b}{a+b}$
$|q| \lt 1 \Rightarrow Q_n$ est convergente.

$$ Q_n = \frac{a-b}{a+b}Q_{n-1} = (\frac{a-b}{a+b})^2 Q_{n_2} = (\frac{a - b}{a + b})^{n-1} \rightarrow 0 $$

$$ Q_n = P_n - 1/2 \Rightarrow P_n \rightarrow 1/2 $$

## Variables aléatoires réelles

Une **variable aléatoire réelle** $X$ est une application **mesurable** de
$(\Omega, C, P)$ dans $(\mathbb{R}, B)$.

où B est une **tribu borélienne** càd la tribu engendrée par les intervalles de R.

> Un boréelien c'est un interval apparemment.

$X: (\Omega, C, P) \mapsto (R, B)$

**Exemple:**
On lance 2 dés équilibrés et on s'intéresse à la source de points.
$\Omega = (i,j)$ avec $1 \le i \le 6$ et $1 \le j \le 6$

$ X: (i,j) \mapsto i + j $
$E = \{2, ..., 12\}$

$P(X=5) = P(X^{-1}(5))$ (image réciproque)
$P(X=5) = P(\{ (2, 3); (3,2), ... \}) = 4/36 = 1/9$

### Fonction de répartition de X

On appelle **fonction de répartition** de X:
$$ F(x) = P(X \le x) \forall x \in \mathbb{R} $$
$$ F: \mathbb{R} \mapsto [a, 1] $$

F est une **application croissante**, $F(-\infty) = 0$ et $F(+\infty) = 1$

### Densité

Si X est une **variable aléatoire continue**

$$P(a \lt X \lt b) = \int^b_a f(x)d(x)$$

où f(x) est la **densité** de X.

1. $f(x) \ge 0$
1. $\int_{\mathbb{R}} f(x)dx = 1$

$$P(a \lt X \lt b) = F(b) - F(a)$$
$$F^{\prime}(x) = f(x)$$

F est une primitive de f.

## Moments d'une variable aléatoire X

### Espérance mathématique de X

Si X est une va discrète, on appelle espérance de X:

$$ E(X) = \sum_i x_i P(X=x_i) $$

> L'esperance mathématique en fait c'est une **moyenne pondérée**

Si X est une va **continue** (avec une densité donc), c'est une intégrale.

$$ E(X) = \int_{\mathbb{R}} xf(x)dx $$

#### Propriétés

E est **linéaire**:

$$ E(aX + bY) = aE(X) + bE(Y)$$

$$ E(a) = a$$

## Variance de X

On appelle variance de X:

$$ V(X) = E((X - E(X))^2) $$

## Ecart type

$$ \sigma = \sqrt{V(X)} $$
$$ \sigma^2 = V $$

> La variance ou l'écart type, c'est une mesure de **la dispersion de X autour
> de la moyenne (l'espérance)**.

### Cas discret

$$ V(X) = \sum_i (x_i - E(X))^2 P(X=x_i)$$

### Cas continu

$$ V(X) = \int_{\mathbb{R}} (x - E(X))^2 f(x)dx = \int_{\mathbb{R}} (x - m)^2 f(x)dx $$

On pose souvent $m = E(X)$ vu que E(X) c'est une valeur fixe.

# Formule de König-Huygens

$$ V(X) = E(X^2) - E^2(X) $$

## Propriétés

V n'est pas linéaire:
$$ V(\alpha X) = \alpha^2 V(X) \forall \alpha \in \mathbb{R} $$

$$ V(X + Y) \ne V(X) + V(Y) $$

### Cas particulier

Si X et Y sont **indépendantes** $ V(X + Y) = V(X) + V(Y) $

# Lois discrètes (usuelles)

## Loi uniforme

Valeurs de $X = \{1, ..., n\}$
$$ P(X=k) = \frac{1}{n} \forall k=1,2,3,...,n $$

### Esperance

$$E(X) = \sum_{k=1}^n k P(X=k)$$
$$E(X) = \sum_{k=1}^n k \frac{1}{n} = \frac{1}{n} \sum_{k=1}^n k $$

et on sait que $\sum_{k=1}^n k = \frac{n(n+1)}{2}$

$$E(X) = \frac{1}{n} \frac{n(n+1)}{2} = \frac{n+1}{2}$$
$$E(X) = \frac{n+1}{2}$$

### Variance

$$ V(X) = E(X^2) - E^2(X)$$
$$ E(\varphi(X)) = \sum_i \varphi(x_i) P(X=x_i) \forall \varphi$$

$$E(X^2) = \sum_{k=1}^n k^2 P(X=k) = \frac{1}{n} \sum_{k=1}^n k^2 $$

$\varphi(X) = X^2$ or

$$ \sum_{k=1}^n k^2 = \frac{n(n+1)(2n+1)}{6} $$

$$E(X^2) = \frac{1}{n} \frac{n(n+1)(2n+1)}{6} = \frac{(n+1)(2n+1)}{6} $$
$$V(X) = ... = \frac{n^2 - 1}{12} $$

## Loi de Bernouilli

C'est une variable logique X definie par:

* $X=1$ si $A$ se realise avec la proba $p$
* $X=0$ si $\bar{A}$ se realise avec la proba $1-p$

X: **fonction indicatrice** de l'événement A.

### Esperance

$$ E(X) = \sum_0^1 k P(X=k) = P(X=1) = p$$
$$ E(X) =  p$$

### Variance

$$ V(X) = E(X^2) - E^2(X) $$
$$ E(X^2) = \sum_0^1 k^2 P(X=k) = P(X=1) = p $$
$$ V(X) = p - p^2 = p(1-p) = pq$$

## Loi binomiale B(n,p)

On répète n fois l'expérience de Bernouilli dans des conditions identiques.
Les événements sont indépendants.

X: nombre de réalisation de A.

$$\forall k = 0,1,...,n$$
$$P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}$$

$$ \binom{n}{k} = \frac{n!}{k!(n-k)!} $$

$X = \sum_{i=1}^n X_i$, $X_i$ suit $B(p)$.

$$E(X) = \sum_{i=1}^n E(X_i)= \sum_{i=1}^n p = np$$
$$V(X) = \sum_{i=1}^n V(X_i)= \sum_{i=1}^n pq = npq$$

## Loi de Poisson P($\lambda$)

X une va entiere positive,

$$ P(X=k) = e^{-\lambda} \frac{\lambda^k}{k!}, \forall k \in N$$

$\lambda$ parametre de Poisson.

> **Theoreme** Soit $(X_n)$ une suite binomiale B(n, p) alors $X_n$ converge en
> loi vers la loi de Poisson $P(\lambda=np)$ lorsque $n \rightarrow + \infty$ et
> $p \rightarrow 0$
> $$ B(n, p) \approx P(np) $$

> **Remarque**
> En pratique, cette approximation est tres satisfaisante des que:
> $ n > 50 $ et $ p < 0,1 $
> n grand et p faible en gros.

### Esperance

$$E(X) = \lambda$$

> **demo**
> $$E(X) = \sum_{k=0}^{+\infty}kP(X=k) = \sum_{k=0}^{+\infty}ke^{-\lambda} \frac{\lambda^k}{k!}$$
> $$E(X) = e^{-\lambda}\sum_{k=1}^{+\infty} \frac{\lambda^k}{(k-1)!}$$
> $$E(X) = e^{-\lambda} \lambda \sum_{k=1}^{+\infty} \frac{\lambda^{k-1}}{(k-1)!}$$
> **Rappel**
> $$ \sum_{k=0}^{+ \infty} \frac{x^k}{k!} = e^x $$
> donc,
> $$E(X) = e^{-\lambda} \lambda e^{\lambda} = \lambda$$

### Variance

$$ V(X) = E(X^2) - E^2(X) $$
$$ E(X^2) = \sum_{k=0}^{+ \infty} k^2 P(X=k)$$
$$ E(X^2) = e^{-\lambda} \sum_{k=0}^{+ \infty} k^2  \frac{\lambda^k}{k!}$$
$$ E(X^2) = e^{-\lambda} \sum_{k=1}^{+ \infty} k  \frac{\lambda^k}{(k-1)!}$$
$$ E(X^2) = e^{-\lambda} \sum_{k=1}^{+ \infty} (k-1+1)  \frac{\lambda^k}{(k-1)!}$$
$$ E(X^2) = e^{-\lambda} (\sum_{k=2}^{+ \infty} \frac{\lambda^k}{(k-2)!} + \sum_{k=1}^{+ \infty} \frac{\lambda^k}{(k-1)!})$$
$$ E(X^2) = e^{-\lambda} ( \lambda^2 \sum_{k=2}^{+ \infty} \frac{\lambda^{k-2}}{(k-2)!} + \lambda \sum_{k=1}^{+ \infty} \frac{\lambda^{k-1}}{(k-1)!})$$
$$ = e^{-\lambda}(\lambda^2 e^{\lambda} + \lambda e^{\lambda}) = \lambda^2 + \lambda$$
$$ \Rightarrow V(X) = \lambda^2 \lambda - \lambda^2 = \lambda $$

## Loi hypergeometrique $H(N, n, p)$

Soit une population de N individus parmi lesqels une proportion p possedant un
certain caractere.
On preleve un echantillon de taille n.
Soit X la va nombre d'individus de cet echantillon possedant le caractere.
(Tirage sans remise)

$$ P(X=k) = \frac{\binom{Np}{k}\binom{N-Np}{n-k}}{\binom{N}{n}} $$

> Significations des combinaisons (de gauche a droite, de haut en bas)
> 1. Nombre de groupes de K individus possdent le caractere.
> 1. Nombre de groupes de N-k ne possedant pas le caractere.
> 1. Nombre d'echantillons possibles (tous les groupes possibles)

On dit que X suit la loi hypergeometrique $H(N, n, p)$.

### Esperance

$$ E(X) = np $$

### Variance

$$ V(X) = (\frac{N-n}{N-1})np(1-p) $$

> **Theoreme**
> Cette loi H(N, n, p) converge en loi vers la loi binomiale B(n, p) quand $N \rightarrow + \infty$. (quand population tres grande)

> En pratique, cette approximation est tres bonne quand $\frac{n}{N} < 10\%$
> Cette fraction, c'est ce qu'on appelle le *taux de sondage*.

## Loi geometrique et loi de Pascal

Soit X la va nombre d'essais necessaires pour faire apparaitre un evenement A de
probabilite p pour la premiere fois.

Les evenements sont indépendants.

$$ P(X=k) = (1-p)^{k-1}p, \forall k \le 1 $$

On dit que X suit la loi geometrique de parametre p notee $X \rightarrow G(p)$.

$$ E(X) = \frac{1}{p} $$
$$ V(X) = \frac{q}{p^2} $$

> **Loi de Pascal**
> Soit X la va nombre d'essais necessares pour observer n fois l'evenement A de
> probabilite p.
> L'experience se fini forcement par A.
> A observe n fois. (geometrique c'etait 1 fois.)

$$ P(X=k) = p \binom{k-1}{n-1} p^{n-1}q^{k-n} $$
$$ P(X=k) = \binom{k-1}{n-1} p^{n}q^{k-n} $$

> **NB** Valable $\forall k \ge n$.

> **Remarque**
> $ X = \sum_{i=1}^{n}X_i$ somme independante de va geometrique $X_i \rightarrow G(p)$ $\forall$ i

### Esperance

$$ E(X) = \sum_{i=1}^{n} E(X_i) $$
$$ E(X) = \sum_{i=1}^{n} \frac{1}{p} = \frac{n}{p}$$

### Variance

$$ V(X) = \sum_{i=1}^n E(X_i) $$

> On a le droit de sommer les variances car les $X_i$ sont **independants**.
> Sinon ca ne serait pas linéaire !

$$ V(X) = \sum_{i=1}^n \frac{q}{p^2} $$
$$ V(X) = \frac{nq}{p^2} $$

# Exercice 5

> Dans une entreprise, une machine produit des pieces dont les dimensions
> doivent etre respectees.
> i. Apres un 1er reglage on constate une proportion de 30% de pieces
> defectueuses.
> On examine 5 pieces au hasard dans la production. X represente le nbre de pieces defectueuses parmi 5.
> 1. Quelle est la loi de X?
> 1. Calculer E(X) et V(X)?
> 1. Quelle est la proba que 2 des pieces soient defectueuses?
> 1. Quelle est la proba qu'il n'y ait pas plus d'une piece defectueuse?


1. Quelle est la loi de X?

Evenements independants (2 issues, defectueux ou pas) et on repete l'experience 5 fois.

Donc la loi de X c'est une loi binomiale $B(n, p)$ avec $n=5$ et $p=30\%$.

2. Calculer E(X) et V(X)?

$$ E(X) = np = 5 \times 0,3 = 1,5$$
$$ V(X) = npq = 5 \times 0,3 \times 0,7 = 1,05$$

3. Quelle est la proba que 2 des pieces soient defectueuses ?

$$P(X=k) = \binom{5}{k} (0,3)^k (0,7)^{5-k}$$
$$P(X=2) = \binom{5}{2} (0,3)^2 (0,7)^{5-2} = 0,3087 $$
$$\binom{5}{2} = \frac{5!}{2! 3!} =\frac{4 \times 5}{2} = 10 $$

4. Quelle est la proba qu'il n'y ait pas plus d'une piece defectueuse?

$$ P(X \le 1) = P(X=0) + P(X=1) $$
$$ P(X \le 1) =  (0,7)^5 + \binom{5}{1}(0,3)(0,7)^4$$

> II. Apres un 2e reglage, la proportion des pieces defectueuses devient 5%. On examine un lot de 100 pieces.
> 1. Calculer P(X=0)
> 2. Calculer P(X=2)
> 2. Calculer P(X<3)

1. X suit B(100, 5%)

> n = 100 > 50
> p = 0,05 < 0,1
> $B(n, p) \approx P(\lambda = np)$ avec $\lambda = 5$.

$$ P(X=0) \approx e^{-5} \frac{5^0}{0!} = e^{-5} = 0,0067 $$

2.


$$ P(X=0) \approx e^{-5} \frac{5^{-2}}{2!} = 0,084 $$

3.

$$ P(X \gt 3) \approx P(X=0) + P(X=1) + P(X=2) = e^{-5} + 5e^{-5} + 0,084 = 0,125$$

# Exercice 6

> Une urne contient 4 boules blanches et 5 boules noires. On tire simultanement 3 boules dans l'urne, sans remise donc.
> X va nbre de boules blanches obtenues
> 1. Donner la loi de X et E(X)
> 2. $\forall i \in [[0, 3]]$ on note $A_i$ "X=i", calculer $P_i = P(A_i)$
> 3. On remet dans l'urne les boules noires obtenues et on garde les blanches.
> Puis on tire une 4e boule.
> Quelle est la proba d'obtenir une boule blanche?

1. C'est une loi hypergeometrique $H(9, 3, 4/9)$.

$$ E(X) = np = 3 \times 4/9 = 4/3 $$

En moyenne on a donc 4/3 de boules blanches.

> 2. $\forall i \in [[0, 3]]$ on note $A_i$ "X=i", calculer $P_i = P(A_i)$

$$ P(X=k) = \frac{\binom{4}{k} \binom{5}{3-k}}{\binom{9}{3}} $$

$$ P_0 = P(A_0) = P(X=0) = \frac{\binom{4}{0} \binom{5}{3}}{\binom{9}{3}} = \frac{5}{42}$$
$$ P(X=1) = \frac{\binom{4}{1} \binom{5}{2}}{\binom{9}{3}} = \frac{10}{21}$$
$$ P(X=2) = \frac{\binom{4}{2} \binom{5}{1}}{\binom{9}{3}} = \frac{5}{14}$$
$$ P(X=3) = \frac{1}{21} $$

> 3. On remet dans l'urne les boules noires obtenues et on garde les blanches.
> Puis on tire une 4e boule.
> Quelle est la proba d'obtenir une boule blanche?

Soit B "la 4e boule est blanche"

$$ B = (B \cap A_0) \cup (B \cap A_1) \cup (B \cap A_2) \cup (B \cap A_3) $$
$$ P(B) = \sum_0^3 P(B \cap A_i) = \sum_0^3 P(B/A_i)P_i$$

or $ P(B \cap A_i) = P(B/A_i) P(A_i)$
$P(B / A-i) = \frac{4-i}{9-i}$ $\forall i = 0,1,2,3 $

$$ P(B) = \sum_0^3 (\frac{4-i}{9-i})P_i$$
$$ P(B) = 4/9 \times 5/42 + 3/8 \times 10/21 + 2/7 \times 5/14 + 1/6 \times 1/21 = 1807/5232$$

# Exercice 7

> Pour acceder a un guichet il faut une carte magnetique et un code confidentiel.
> Un client tapant un code au hasard est refuse 999 fois sur 1000.
> Soit $X_i$ le nombre d'essais pour acceder au guichet par hasard.
> 1. Donner la loi de probabilite de X et calculer P(X=1)
> 2. Sachant qu'au bout de 3 essais infructueux la carte est confisquee, calculer la probabilite d'acceder au guichet par hasard.
> 3. Combien faut-il d'essais en moyenne pour acceder au guichet par hasard?


> 1. Donner la loi de probabilite de X et calculer P(X=1)

C'est une loi geometrique avec p = 1/1000

$$ P(X=k) = p(1-p)^{k-1} $$
$$ P(X=1) = p = 0,001 $$

> 2. Sachant qu'au bout de 3 essais infructueux la carte est confisquee, calculer la probabilite d'acceder au guichet par hasard.

$$ P(X \le 3) = P(X=1) + P(X=2) + P(X=3)$$
$$ P(X \le 3) = p + qp + q^2p $$
$$ P(X \le 3) = 0,001 + (1-0,001)(0,001) + (1-0,001)^2(0,001) \approx 0,002997$$

> 3. Combien faut-il d'essais en moyenne pour acceder au guichet par hasard?

$$ E(X) = \frac{1}{p} = 1000 $$
# Lois continues
