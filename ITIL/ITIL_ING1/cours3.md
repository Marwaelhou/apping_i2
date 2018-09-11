* @file cours3.md
* @author Rod Guillaume
* @date 25 May 2018
* @copyright 2018 Rod Guillaume
* @brief Service Operation

# Rappels

service = apporte valeur = utile + fiable

processus = entree -> plusieurs processus -> sortie

Avec un systeme de controle de ces processus.

Les processus repondent a des incidents, des requettes, des evenements, des
problemes.

evenement = notification dans le SI (tout et n'importe quoi)

incidents = qques milliers, symptomes d'un probleme.

probleme = cause de 1 ou plusieurs incidents

> PC qui marche plus. Fix incident = changer le PC. regler le pb c'est trouver
la cause de la panne et la fix.

requete = demande qui est standard (catalogue de service definit les requests
possibles) et sont pre-approvees.

Si on opere avec ces 4 trucs, request, function etc. on opere efficacement et
de maniere agile.

# Service Operation

Une bonne image de marque c'est aussi lie a 'est ce que c'est operationnel?'.
Y'a pas que la com. Y'a le "est ce que ca marche ou pas ce SI de cette
entreprise?"

## Event Management

Avoir des bacs a evenements qui collectent l'ensemble des evenements.

Generalement on a un bac a event par technologie.

> Bac a event reseau, database, applications...

Par dessus, on ajoute un *filtre*. Pour ne traiter que les events qui ont
vraiment un interet.

> PING automatique toutes les 10 mins pour check qu'un service est up. On veut
ignorer quand c'est up et avoir un event quand c'est down.

Superviseur = bac ou on recoit tous les evenets filtres.

Hyperviseur = on traite ces trucs filtres, on retire les faux positifs. La
dedans on a tous les trucs importants.

Apres on fait un *service mapping* pour choisir dans quel ordre on traite.

Genre si y'a 2 routeurs down, un dans une grosse infrastructure et l'autre dans
une petite. Bah la grosse y'a des chances qu'il y ait un routeur redondant pour
venir en backup.

Pareil si y'a des incidents majeurs que je dois resoudre en 3h sinon j'ai des
penalites, bah c'est prioritaire pendant 3h et si on a paye les penalites bah
il devient moins important. Son impact sera moindres.

# Incident Management

incident = evenement non standard qui cause ou qui peut causer une degradation
ou un arret du service.

Y'a plusieurs milliers d'incidents par jour.
> Chez EDF 600 000 par mois.

On utilise des outils, comme les *tickets*, les *mails*, les *appels*, etc. Ca
depend des boites.

*Help desk* : ceux qui repondent aux appels, aux tickets. Le support quoi.

Quand on recoit une demande, mais qu'on la refuse, on la note quand meme en
incident. Ca permet d'avoir des metrics pour savoir si c'est un probleme
montant ou pas pour voir si on fait pas une ressource pour aider les gens avec
ce pb etc.

## Processus gestion incident

Restaurer l'etat en minimisant l'impact sur les postes metiers.

> On cherche pas forcement a regler le probleme, mais on cherche a reduire
l'impact sur le poste service.
On restaure le service le plus rapidement possible avant de chercher plus loin.

1. On categorise l'incident (reseau, database, applicatif, reset de password, etc.)
1. On priorise selon deux axes
    1. Impact
    1. Urgence
    1. ca ressemble au tableau des risks en qualite.
    1. selon la gravite de l'incident, on donne un engagement de resolution de
      1h, 8h, etc.

1. On fait un diagnostique
1. on le passe a l'equipe competente (vu qu'on l'a categorise) (escalade)
1.  ils enquetent, ils le resolvent, ils font le recovery et une fois qu'on a
    confirmation qu'il est resolu on close.

Apres il parle de l'importance des portails pour la gestion des incidents. Que
ca correspond a l'esprit de l'entreprise. Apparemment le design, le *look and
feel*. mdr

Pour les incidents critiques, on met en place une procedure plus courte avec
plus d'urgence. Genre limite on arrete l'activite de toute l'equipe pour que
toute les ressources sont dessus.

### escalade

L'escalade, ca permet soit de refiler l'incident a une equipe plus competente.
C'est de l'escalade functional.

Sinon on veut peut etre informer ses superieurs, ses managers. Dans ce cas on
fait une escalade hierarchical.

### Investigation, diagnostique

### Resolution and Recovery

Il n'est pas encore clos quand on a resolu un incident.

C'est pas pcq techniquement c'est resolu, que le service est rendu et que
l'utilisateur peut reutiliser le service.

### Closure

On recontacte la personne qui a appele pour l'incident, et si l'utilisateur n'a
toujours pas le service on ouvre un deuxieme incident.

## Problem Management

Ici on cherche a prevenir les incidents, et que l'impact des incidents soit
moins fort. On veut fix les incidents recurrents.

Comment on peut detecter ces problemes, comment on les previent ?

On regarde les 5 apps qui generent le plus d'incident. On analyse les metrics
qu'on a cree pendant les incidents.

On marque des applications ou des zones a risque.

Probleme = cause de 1 ou plusieurs incidents.

L'application est elle bugge? Y'a t'il une nouvelle version ? Les utilisateurs
ont ils ete mal formes.

Au dela de l'analyse des %age d'incidents sur tel truc, on a aussi des outils
pour investiguer sur un probleme en particulier. Y'a des diagrammes a faire,
etc.
