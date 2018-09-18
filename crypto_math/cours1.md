* @file cours1.md
* @author Rod Guillaume
* @date 18 Sep 2018
* @copyright 2018 Rod Guillaume
* @brief <brief>
* @mail_prof cryptoing2@gmail.com

> Exemple de question QCM.
> 1. Donner la signification des initiales de RSA

Sur TLS, apparemment c'est uniquement le server qui doit etre authentifie. A
verifier, je sais pas si c'est utile mais c'est pas ecrit dans les slides.

3 pilliers de la crypto:
1. authentification
1. confidentiality
1. integrity

Dans son petit dessin de l'echange client-server, jusqu'a Key Exchange et Cipher
Suite, c'est en clair.

# Enigme cadeau cadenas

1. Bob a un cadenas public que toutes les alices peuvent acheter
1. Methodes avec plusieurs voyages (sans echange de cle)
    1. alice met un cadenas
    2. bob met son cadenas et renvoie
    3. alice retire son cadenas et renvoie
    4. bob peut ouvrir son cadenas et recuperer le message


Des choses qu'on gere mal en crypto:
* revocation
* non repudiation
  * TLS ne gere pas la repudiation

Interdit d'exporter de la crypto aux US. **Loi ITAR**.
> Exemple de Bernstein
> etudiant, il fait un algo de chiffrement pour apprendre.
> Il a publie le code source, du texte, et pas du code compile donc il a evite
> la prison.
