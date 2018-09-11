* @file cours2.md
* @author Rod Guillaume
* @date 25 Apr 2018
* @copyright 2018 Rod Guillaume
* @brief <brief>

# Culture of organizations

**Culture**: the way of life of a group of people in a organization based on
behaviors, beliefs, values, and symbols that they accept, generally without
thinking about them and that are passed along by communication.

## Maturite des entreprises au sein des cultures

Une entreprise peut etre organisee en mode impro, routine ou process. Il y a 3
cultures de fonctionnement.

1. Improvisation: unique situations, immediate reaction, 'do something', trial
and error.

> AirBnb

2. Routine: repetitive, familiar, continuous, automatic
> On le fait parce qu'on est habitue.
> Les artisans, le boucher, etc. On apprend et on repete.

3. processing: cyclic, structured, especially designed, managed
> pour etre efficace, on va reflechir a notre maniere de travailler, etc.
> On a reussi a gommer les differences de culture, on y a reflechi.

> Air Liquide (25k employees) a un process pour creer un nouveau site et de le
rentrer dans le SI global en 4 semaines. Il a une integration dans le SI 'out
of the box'. Ils auront directement acces a la messagerie et tout.
> Ca leur permet de s'ouvrir sur un nouveau marche tres rapidement.

Ce cours, `ITIL`, s'inscrit dans une optique de niveau de culture `processing`.

4. Mode projet: mode de fonctionnement a part.
temporaire, une seule fois, avec un but defini et avec une organisation dediee.

# Processes bridge all the organization

A **role** os a set of responsibilities and powers dedicated to a function
across activities/processes.

## Roles

* Requester : demande
* Approver : approuve
* Technician : realise

Ces acteurs sont peut-etre dans des organisations differentes, mais vont
construire un processus.

**Process** : demand -> aprove -> provision.

Ces roles sont evidemment interchangeable ca depend de la situation.
Un approuveur de certains trucs peuvent etre demandeur d'autres choses.

Genre un chef de projet qui generalement approuve peut tres bien demander un
nouveau materiel. C'est evidemment pas a lui d'approuver sa propre demande.

## Roles au sein d'un service

**Service owner**: responsible to the customer for particular service:
* initiation and transition
* ongoing maintenance and support
* monitoring and reporting
* identifying improvement opportunities
* prime customer contact

The **process owner** is responsible for:
> C'est celui qui decrit le processus.

>Il est en charge que le processus soit decrit, que les personnes impliquees
soient formees et que les outils fonctionnent et jouent leur role. Il analyse
aussi l'efficacite, son taux d'echec etc.

> C'est un role sur le long terme/moyen terme. On l'analyse pour que demain il
s'ameliore, de maniere continue.

* assisting with process design
* documenting the process
* Making sure the process meets its aims
* monitoring and improving the process over time

The process **manager** is responsible for operational management of a process.
> Responsable du *help desk*. Il gere les ressources, et prend a chaud des
informations pour s'assurer que le service est rendu. Il est dans le court
terme.

# ITIL c'est quoi ?

ITIL = le cadre, les bonnes pratiques au sein d'une entreprise pour bien faire
fonctionner leur SI.

> Information Technology Infrastructure Library

C'est un livre, des publications de bonnes pratiques.

Pense en Angleterre dans les 80s par Margaret Tatcher.

* En 1988, la premiere version de ITIL est publiee. Y'avait un cadre de
  management pour chaque service. Tout se contredisait, y'avait 80 publications
  c'etait la bazar.

* En 2000, on s'est reuni en groupes pour reflechir autour d'ITIL. 6 livres
  sont publies, et deviennent la bible pour les grosses entreprises.

> Surtout les deux parties *Service delivery* and *service support*.
> ISO 20 000 est cree, inspiree par ITIL.

ITIL is a set of good practices to set up an IT service management framework.

Dirige par 3 points cles:

* Aligner les SI en fonction des enjeux des metiers.
* improve IT service quality
> faire en sorte qu'on delivre la qualite *attendue*.
Pas la meilleure, mais celle qui est necessaire pour le metier.

> Si on delivre une qualite trop importante, trop au dessus, c'est pas bon pour
nous. Ca veut dire qu'on a trop couté. On a pas besoin d'une qualite over uber
mega bonne. Juste le necessaire. Sinon on coute trop cher a l'entreprise.

> Exemple du mec de SFR qui s'est fait virer parce qu'il a une qualite bien
trop importante.

> Faut savoir taper juste. Au niveau ou on s'est engage, mis d'accords.

* Manage costs to deliver IT

ITIL is a *public framework* that describes best practic in IT service
management. Ca donne un cadre pour la gestion du SI, il se concentre sur le
*continual measurements and improvement*  de la qualite de service du SI
delivree, aussi bien du cote business et client.

Ca permet de partager le *meme vocabulaire* partout dans le monde. Tout le
monde a la meme definition d'un incident, etc.


# Service management stakeholders

acteurs majeurs = *stakeholders*.

* Client/Customer: benefits from the service, usually finances he request demand.
* User: daily uses the service
> User il a un avis pertinent sur le service.
> Le client final qui va valider le budget, les fonctionnalites, etc.

* IT service provider: entity responsible to deliver the service
* 3rd party supplier (external) : entity responsible to deliver (sub-contracts)
  the service or part of the service.

> Entre 40 et 50% d'employes externes.

> 1/2 employes n'est pas de l'entreprise.
Faut donc faire attention a coordonner ces differents acteurs, qui viennent
d'horizon differents.

# Service management ?

Service management set de capacites, etc.

# Service lifecycle

![Roue ITIL](https://robertjrgraham.com/wp-content/uploads/2013/01/itil_v321.jpg)

2 livres les plus importants de l'ITIL:

Conception des services, Service Transition (comment je le mets en production)
et comment j'opere le service.

Conception, production, opere un service.

* En 2007, ITIL v3 est sorti.
> Controverse, car apres le succes ITIL v2 c'est devenu un enjeu commercial.
> HP a essaye de mettre la main sur v3
> Maintenant ils ont mis 35 processus au lieu de 12 avant...

Aujourd'hui c'est rare les entreprises qui ont implemente l'ensemble d'ITIL v3.

# Comment j'opere un service ?
## Event, Incident, Problem and request

Ce sont 4 processus. ITIL definit tous ces mots pour que tout le monde parle de
la meme chose.

*Event*: n'importe quoi, bien ou pas bien.
> Connecter son PC sur le reseau WiFi est un event.
> Connexion ratee => event.
> operation qqc sur un serveur => event

> Combien d'events sur un SI par jour ?
> SFR 1 million (10k personnes)

Donc l'enjeu c'est comment traiter les events pour savoir ceux qui ont un sens
et ceux qui n'en ont pas.

*Incident*: Un event qui ne fait pas parti des operations standards et qui
cause ou peut causer un arret ou une degradation de la QoS.
> PC tombe en panne -> incident.
> Je le remplace par un nouveau -> incident resolu.


Service management = resoudre le plus rapidement possible les incidents

*Problem*: cause de 1 ou plusieurs incidents.

Incidents ce sont les symptomes.
Probleme c'est la cause !

*request*: demande classique, standard.
> Je demande un nouveau PC

## Les portails

Chaque entreprise a son portail pour deposer ses demandes, annoncer les
incidents etc.
