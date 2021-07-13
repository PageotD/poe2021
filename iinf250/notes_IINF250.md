_IINF250_

# Orchestrer les opérations de mise en production

L'ordonnancement des tâches informatiques est la planification et la synchronisation des travaux batch, quelle que soit leur nature et quels que soient les systèmes d'exploitation.

## Domaine d'exploitation

Le domaine d'exploitation est l'entité de niveau supérieur de Visual TOM. Il regroupe l'ensemble des défintions et des identifiants de la production.

- **Date d'exploitation**: la date d'exploitation représente une journée de production, indépendante de la journée système allant de minuit à minuit; c'est la référence pour l'execution des travaux.
- **Utilisateur**: un utilisateur est un compte sous lequel sont soumis les traitements, sur un agent.
- **Agent**: l'agent correspond au nom d'une plateforme agent Visual TOM sur laquelle s'executent les traitements.
- **Unité de soumission**: l'unité de soumission est un ensemble d'agents; son mode d'éxecution détermine sur quel(s) agent(s) soumettre le traitement.
- **Queue batch**: une queue batch représente, indépendamment du système d'exploitation de la machine cible, un comportement d'éxecution propre au type de tâche à executer.
- **Calendrier**: dans un calendrier sont définis les jours d'exception (jours chômés).
- **Période**: la période représente un laps de temps non conventionnel, borné par une date de début et une date de fin.
- **Jeton**: un jeton est une partie de formule de planification.
- **Ressource**: une ressource représente une contrainte de démarrage ou un paramètre dont la valeur est fournie au traitement.
- **Alarme**: une alarme représente un évènement inattendu, sur un état, ou sur une durée atteinte.
- **Consigne**: une consigne indique au pilote les actions à mener face à un évènement.
- **Serveur applicatif**: un serveur applicatif désigne un ERP sur lequel sont exécutés des travaux, et contient ses caractéristiques d'accès pour établir la connexion.$
- **Modèle**: un modèle désigne un type de traitement pré-établi, à partir duquel de nouveaux traitements sont réalisés.
- **Compte utilisateur**: un compte utilisateur décrit des caractéristiques de connexion pour usage des interfaces.
- **Profil**: un profil désigne les droits associés à un compte utilisateur.
- **Vue**: la vue est un regroupement logique de traitements et/ou applications.
- **Collection**: la collection est uneliste d'objets (environnement, application, traitement) à partir de laquelle sont générés des clichés contenant les caractéristiques de ces objets; la comparaison de deux clichés produit un différentiel graphique.

## L'environnement

L'environnement est un sous-ensemble du domaine d'exploitation. Il regroupe un ensemble d'applications. Un environnement indépendant des autres, permet de décrire:
- un contexte technique d'exécution, par exemple un environnement par machine physique
- une segmentation fonctionnelle du système d'information, par exemple un environnement de recette.

L'environnement représente un espace étanche piloté par un processus dédié: le moteur.

Le **moteur** calcule la planification et l'ordonnancement des travaux. Il prend toutes les décisions inhérentes à l'execution d'un traitement.

Les fonctions principales de l'environnement sont les suivantes:
- fournir des valeurs par défaut aux applications et traitements, par exemple l'unité de soumission par défaut sur laquelle seront sélectionnés les agents pour soumettre les travaux,
- associer des objets pour les utiliser dans les applications et les traitements, par exemple en autorisant seulement une liste d'unités de soumission pour l'execution des travaux,
- limiter le compte utilisateur au niveau de ses droits, par exemple avec un accès  en écriture sur l'environnement "recette".

## L'application

L'application est un ensemble cohérent de traitements. C'est un regroupement logique des travaux répondant aux mêmes contraintes, et dont l'execution constitue un résultat. Une application est définie dans un environnement.

Sur une application sont notamment spécifiés:
- la planification
- les contraintes de démarrage
- les attributs par défaut qui seront utilisés par ses traitements
- le comportement en cas d'erreur.

Pour prendre en compte les valeurs différentes sur une plage de temps donné (par exemple, l'unité de soumission par défaut), l'utilisateur définit une modification temporaire sur l'application. En fonction de la valeur de la date d'exploitation, le moteur utilise la définition de référence ou la modification temporaire correspondant à cette plage.

Il existe différents types de lancement pour les applications:
- **Périodique**: l'application est lancée une seule fois selon la fréquence sélectionnée, en fonction de son planning
- **A la demande**: l'application n'est lancée qu'à condition d'être demandée (action manuelle); cette option nécessite l'attribution d'une heure minimum de démarrage et d'une heure maximum de démarrage, ainsi que d'un planning valide; si l'application n'est pas demandée avant l'heure maximum de démarrage, elle est déplanifiée.
- **Cyclique permanent**: le lancement cyclique correspond à un mode itératif: dès qu'une execution se termine, une nouvelle execution a lieu, sans attente intermédiaire; cette option nécessite l'attribution d'une heure minimum de démarrage et d'une heure maximum de démarrage, ainsi que d'un planning valide.
- **Cyclique au format HH:MM:SS**: entre deux exécutions, l'attente correspond au cycle spécifié.
- **Cyclique au format cron**

La fréquence limite le nombre d'éxécutions dans un laps de temps. Il existe quatre modes: journalière, hebdomadaire, mensuelle et annuelle.

L'heure de démarrage du premier lancement, si toute sles contraintes sont validées est par défaut: 00:00:00. L'heure de démarrage maximum, au delà de laquelle il n'y aura pas de lancement mais déplanification est limitée à 47:59:59 (par défaut 23:59:59).

Il existe également plusieurs paramètres d'éxécution:
- **mode éxécution**: ce mode signifie que tous les traitements de l'application sont executés, quelque soit leur mode d'éxécution propre.
- **mode simulation**: ce mode signifie que tous les traitement de l'applciation sont simulés, quel que soit leur mode d'éxécution prore; les traitements ne sont pas soumis sur les machines cicbles; le moteur valide uniquement la planification et les enchaînements.
- **mode test**: ce mode signifie que tous les traitements de l'application sont testés, quel que soit leur mode d'execution propre; en mode test, lors de la soumission, le traitement hérite d'une varible d'environnement; la valeur est testée préalablement à la soumission effective (queue batch), ou dans le script lui-même.
- **mode stop**: ce mode signifie que l'application voit sa planification invalidée (statut non-planifié)
- **mode traitement**: valeur par défaut; ce mode signifie que le mode d'éxécution pris en compte est celui qui est défini au niveau du traitement.

Valeur héritées de l'environnement: unité de soumission, Utilisateur, queue Batch, date [...?]

L'application peut prendre dl'un des status suivants;
- **A venir**: l'execution de l'application est planifiée, l'application est en attente de validation des contraintes
- **En cours**: les contraintes de l'applications ont été levées; cela n'implique pas nécessairement qu'au moins l'un de ses traitement soit en cours d'éxécutions
- **Erreur**: l'éxécution de l'application est terminée; au moins l'un de ses traitements "en erreur" dispose de l'option "remonter l'erreur sur l'application"
- **Terminé**: l'éxécution est considérée comme correctement terminée
- **Déplanifiée**: l'éxécution a été annulée, en raison d'une non-validation des contraintes.

Mode d’utilisation Planning indique que la planification est basée sur la validité des champs « Jour », « Semaine », « Mois », « Numéro de jour ». Pour que l’Application soit planifiée, il faut que chaque champ soit validé (ET).

Mode d’utilisation Formule gère des planifications complexes et/ou exceptionnelles, et est basé sur un langage syntaxique (SNL) dans lequel interviennent des mots-clés prédéfinis et des opérateurs arithmétiques courants. La formule contient un ensemble de tests. Dès que l’un des tests est valide, la Planification est validée.

Planification en fonction d’une répétition: pour gérer un cycle de planification en fonction d’une date initiale, et d’un cycle basé sur un nombre de jours, la fonction modulo est prise en compte dans les formules pour utiliser le principe de répétition utilisé dans Sched Task.

## Le traitement

Le traitement est la tâche élémentaire exécutée sur un Agent. Un Traitement est défini dans une Application. Sur un traitement sont notamment spécifiés :
- la planification,
- les contraintes de démarrage,
- le comportement en cas d’erreur,
- les paramètres,
- les actions de fin.

Pour prendre en compte des valeurs différentes sur une plage de temps donné (par exemple, un paramètre), l’utilisateur définit une modification temporaire sur le traitement. En fonction de la valeur de la date d’exploitation, le moteur utilise la définition de référence ou la modification temporaire correspondant à cette plage.

Les traitements disposent des mêmes:
- types de lancement que les applications (périodique, à la demande, cyclique...)
- définitions "heures min-heure max" pour le démarrage
- paramètres d'execution à l'execption du mode traitement
- défintions de statut (à venir, en cours, erreur ...)

Un traitement dispose d'une durée maximum d'éxécution. Dès que ce temps d’exécution est atteint, les processus correspondant au traitement sont supprimés sur l’agent cible, le traitement est vu "En erreur" en mode pilotage.

Un traitement dispose également de plusieurs "comportements" concernant ses successeurs:
- **Déplanifier les successeurs**: ce mode indique l’action à effectuer sur les objets successeurs liés au traitement en fonction de son statut. En cas d’erreur, et en fonction des types de liens utilisés, les successeurs directs sont déplanifiés immédiatement s’ils n’ont pas d’autres contraintes de démarrage que le lien. Si un successeur direct dispose d’une contrainte "heure minimum de démarrage", la déplanification est effectuée lorsque cette heure est atteinte. En cas de déplanification du traitement, les successeurs directs sont déplanifiés immédiatement indépendamment des contraintes horaires dont ils disposent.
- **Déplanifier les successeurs à**: ce mode indique l’action à effectuer sur les objets successeurs liés au Traitement en fonction de son statut. En cas d’erreur ou de déplanification, et en fonction des types de liens utilisés, les successeurs directs sont déplanifiés à l’heure indiquée s’ils n’ont pas d’autres contraintes de démarrage que le lien. Si un successeur direct dispose d’une contrainte « heure minimum de démarrage », la déplanification est effectuée lorsque cette heure est atteinte. En cas de déplanification du Traitement, les successeurs directs sont déplanifiés immédiatement indépendamment des contraintes horaires dont ils disposent.
- **Ne pas déplanifier les successeurs**: ce mode indique qu’en cas d’erreur ou de déplanification du Traitement, aucune action ne sera effectuée sur les successeurs directs.
- **Mettre l’Application en erreur**: ce mode signifie que l’erreur sur un Traitement doit impacter le statut de l’Application. Ce mode est adéquat pour gérer les procédures de secours au niveau de l’Application.
- **Bloquer l’avancement de la Date**: ce mode signifie qu’en cas d’erreur du Traitement, la Date n’est pas candidate à un changement de valeur. Elle est bloquée. Le blocage autorise néanmoins la soumission des Traitements pour la journée de production courante. Une action manuelle est requise pour retirer de la liste le Traitement ayant bloqué la Date. Le déblocage peut être global. Une reprise sur le Traitement en erreur qui aboutit à un succès supprime le Traitement de la liste de ceux qui bloquent la Date.

Le traitement dispose également de différents mode de relance:
- **Automatique**: ce mode indique qu’en cas d’erreur, le Traitement est relancé automatiquement jusqu’à obtention d’une terminaison correcte dans la limite déclarée dans le champ "Nombre de relances".
- **Manuelle**: valeur par défaut; ce mode indique qu’en cas d’erreur, le Moteur ne mettra pas en oeuvre le mécanisme de relance automatique.
- **Script de rattrapage**: ce mode indique qu’en cas d’erreur du Traitement disposant du mode de relance automatique, un script de secours est activé. Le script de rattrapage se situe obligatoirement dans le même contexte : Agent, Utilisateur, Queue batch.

Gestion des **logs en fin de Traitement** est intégrée à la Queue batch.et reçoit en paramètres :
- Un nombre de jours, au-delà duquel les logs sont purgés,
- Un nombre d’occurrences, au-delà duquel les logs sont purgés.

## L'ordonnancement

Pour respecter une séquence de soumission, les Applications et/ou les Traitements sont ordonnancés en fonction de 3 types de contraintes : les Horaires, les Liens et les Ressources :
- Les Horaires sont définis dans l’Application et le Traitement (onglet définition, caractéristiques « heure minimum de démarrage » et « heure maximum de démarrage »).
- Un lien est une dépendance d’ordonnancement entre deux Objets de type Application et /ou Traitement. Il est représenté graphiquement par une flèche dont la couleur indique la nature de la dépendance (facultative, obligatoire…). Il constitue une contrainte pour l’objet successeur.
- Une Ressource est une variable d’exploitation. Associée à une valeur, elle définit une contrainte pour le démarrage d’une Application et/ou d’un Traitement.

Les **liens** représentent une dépendance entre 2 objets (Application ou Traitement). Par convention, le père correspond au prédécesseur direct, le Fils correspond au successeur direct, le grand-père correspond au père du père. Le Moteur confère aux Liens un statut en fonction du statut des Applications ou Traitements « Pères ».

| Type de lien                  | Couleur       | Fonction |
|-------------------------------|---------------|----------| 
| Obligatoire                   | Bleu nuit     | L’Application « Application_2 » attend obligatoirement la bonne fin (statut TERMINE) de l’Application « Application_1 ».|
| Facultatif                    | Vert clair    | L’Application « Application_4 » attend la fin (statut TERMINE, EN ERREUR, NON PLANIFIE ou DEPLANIFIE) de l’Application « Application_3 ».|
| Conditionnel                  | Cyan          | L’Application « Application_6 » attend la bonne fin (statut TERMINE) de l’Application « Application_5 » ou la bonne fin du prédécesseur de l’Application « Application_5 » s’il y en a un et si « Application_5 » est non planifiée (statut NON PLANIFIE). |
| Exclusif                      | Noir          | L’Application « Application_8 » attend la non planification (statut NON PLANIFIE) de l’Application « Application_7 ».|
| En erreur                     | Rouge         | L’Application « Application_10 » attend obligatoirement la fin anormale (statut EN ERREUR) de l’Application « Application_9 ».|
| | | |
| Obligatoire valué| Bleu nuit | Le Traitement « trt_12 » attend obligatoirement la bonne fin (statut TERMINE) du Traitement « trt_11 » et un code retour valide, soit spécifié en tant que valeur, soit inclus dans une plage.|
| Facultatif valué | Vert clair | Le Traitement « trt_14 » attend la fin (statut TERMINE, EN ERREUR) du Traitement « trt_13 » et un code retour valide, soit spécifié en tant que valeur, soit inclus dans une plage.|
| Conditionnel valué | Cyan | Le Traitement « trt_16 » attend la bonne fin (statut TERMINE) du Traitement « trt_15 » ou la bonne fin du prédécesseur du Traitement « trt_15 » s’il y en a un, et si « trt_15 » est non planifié (statut NON PLANIFIE) et un code retour valide, soit spécifié en tant que valeur, soit inclus dans une plage.|
| Exclusif valué | Noir | Sans objet. Un Traitement ne peut être à la fois non planifié et fournir un code retour .|
| En erreur valué | Rouge | Le Traitement « trt_20 » attend obligatoirement la fin anormale (statut EN ERREUR) du Traitement « trt_19 » et un code retour valide, soit spécifié en tant que valeur, soit inclus dans une plage. |


**Lien simple**: Une Application est dépendante d’une seule Application. Un Traitement est dépendant d’un seul Traitement.

**Lien ET**: Une Application est dépendante de plusieurs Applications. Un Traitement est dépendant de plusieurs Traitements. Les Liens peuvent être de type différent. L’Application démarre lorsque tous ses Liens amont sont valides. Le Traitement démarre lorsque tous ses Liens amont sont valides.

**Lien OU**: Une Application est dépendante de plusieurs Applications. Un Traitement est dépendant de plusieurs Traitements. Les Liens peuvent être de type différent. L’Application démarre lorsque l’un de ses Liens amont est valide. Le Traitement démarre lorsqu’un de ses Liens amont est valide.

**Xlien** Un Xlien est une dépendance entre 2 objets dont le père est différent :
- Un Traitement dépend d’une Application, dans le même Environnement
- Une Application dépend d’un Traitement, dans le même Environnement
- Un Traitement dépend d’un Traitement d’une autre Application, dans le même Environnement
- Une Application dépend d’une Application d’un autre Environnement,
- Une Application dépend d’un Traitement d’une Application d’un autre Environnement,
- Un Traitement dépend d’une Application d’un autre Environnement,
- Un Traitement dépend d’un Traitement d’une Application d’un autre Environnement.

Le statut du Fils évolue en fonction du lien et du statut du Père:
- **En attente**: le lien attentd un statut stable du père
- **Valide**: le lien a reçu un statut stable du Père
- **Déplanifié**: le lien n'autorise pas la poursuite en automatique du Fils

L’opérateur logique appliqué entre les différentes **ressources** est un ET : toutes les Ressources doivent être valides pour le déclenchement de l’Application ou du Traitement. L’évaluation de la contrainte sur la Ressource, non valide par défaut, sera valide lorsque le test défini par « ressource opérateur [valeur] » sera vérifié.

## La mise en exploitation

Le Moteur ne traite que les objets mis en exploitation. La mise en exploitation concerne :
- les Applications,
- les Traitements,
- les Liens.

La mise en exploitation peut se faire de manière manuelle (immédiate) ou programmé (planifiée, bascule de date). Une réinitialisation annule la mise en exploitation des objets sélectionnés.



## Hierarchie

|                  | Execution| Gestion du temps | Contrainte |
|------------------|----------|------------------|------------|
| Utilisateur      | X        |                  |            |
| Agent            | X        |                  |            |
| Unité soumission | X        |                  |            |
| Queue Batch      | X        |                  |            |
| Calendrier       |          | X                |            |
| Date             |          | X                |            |
| Ressources       |          |                  | X          |  
| Période          |          |                  | X          |
| Jeton            |          |                  | X          |
| Contexte         |          |                  | X          |
| Alarme           |          |                  |            |
| Consigne         |          |                  |            |
