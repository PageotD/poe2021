_IJVA360_

# JAVA/TOMCAT - Applications WEB

- Le client envoie une requete HTTP au web server et répond par une réponse
- l'application de serveur (tomcat) traite les demandes
- la base de données gère la persistance des données

TomCat fait également Web Server. Mais de façon général, on place devant TomCat est un serveur Web dédié pour des raison de sécurité et de performances entre autres.

## 1-Principes du HTTP

Le client effectue une requête HTTP, ensemble de lignes envoyé au serveur par le client comprenant: URL, méthode (GET, POST...), données

Le serveur traite la requête puis envoie une réponse HTTP: code réponse, données (page HTML, trame XML ou JSON)

Le code réponse indique comment s'est déroulé le traitement de la requête (https://developer.mozilla.or/fr/docs/Web/HTTP/Status):
- 1XX: info
- 2XX: succès
- 3XX: redirection
- 4XX: erreur client
- 5XX: erreur serveur

Les codes les plus connus:
- 200: OK
- 401: identification nécessaire
- 403: accès interdit
- 404: ressource introuvable
- 500: erreur serveur interne

## 2-Serveurs d'application

Logiciel d'infrastructure offrant un context d'execution pour des composants applicatifs:
- sécurité
- transaction
- connecteurs (DB, MQ...)

Implementation d'un langage:
- Java
- Python
- PHP
- ...

Parmis les plus connus:
- Java:
    - Apache TOMCAT
    - IBM Websphere
    - Oracle Weblogic
- Python:
    - Django
- PHP:
    - Zend

## 3-Application web en JAVA

Vocabulaire
- une servlet est une classe Java qui permet de créer dynamiquement des données au sein d'un serveur HTTP: Java qui génère du HTML
- Une JSP est une technique basée sur Java qui permet de créer dyanmiquement des pages web HTML qui inclut du Java.

- https://tomcat.apache.org/whichversion.html permet d'avoir accès aux différentes versions avec leurs specs
- on prend la version 8.5.59: https://tomcat.apache.org/download-80.cgi
- dans la machine virtuelle poe-ubuntu-server
```bash
# On crée un dossier tomcat_install
mkdir -p tomcat_install

# On va dans le dossier
cd tomcat_install

# On récupère les tar.gz et le sha512
wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz.sha512
sha512sum -c apache-tomcat-8.5.69.tar.gz.sha512

# On verifie que tout c'est bien passé
# On doit voir :
# apache-tomcat-8.5.69.tar.gz
# apache-tomcat-8.5.69.tar.gz.sha512
ls -l

# On va dans /usr/local
cd /usr/local/

# On decompresse le dossier
sudo tar -xzvf apache-tomcat-8.5.69.tar.gz

# Creation d'un lien symbolique
sudo ln -s apache-tomcat-8.5.69/ apache-tomcat-8.5

# On va créer un utilisateur pour Tomcat avec un home directory (-d) et un shell bash (-s)
sudo useradd tomcat-8.5 -d /usr/local/apache-tomcat-8.5 -s /bin/bash

# On change les droits pour être sûr que l'utilisateur tomcat-8.5 ait accès à
# apache-tomcat-8.5.69
sudo chown -R tomcat-8.5 /usr/local/apache-tomcat-8.5.69/

# On se connecte sur l'utilisateur tomcat
sudo su - tomcat-8.5

# Demarrage du Serveur
# On va dans le dossier bin accessible par l'utilisateur tomcat-8.5
cd ~/bin
# On lance le bash
./startup.sh
# On recupère l'adresse ip
ip addr
# Dans un navigateur (Brave sous windows par ex.) on met l'adresse ip avec le port d'écoute:
# xxx.xxx.xxx.xxx:8080
# Cela doit ouvrir une page Tomcat

# Pour arrêté le serveur Tomcat
./shutdown.sh

# On va dans le dossiers logs pour regarder les 
# logs de sortie
cd ../logs
# On ouvre catalina.out ave cla commande less
less catalina.out
# Quand le serveur est en route on peut avoir 
# une trace en direct de l'activité
tail -f localhost_access_log.<data>.txt
```

## Les répertoires par défaut

Liste des répertoires par defaut de Tomcat:
- **bin**: pour les binaires et les scripts de démarrage Tomcat
- **conf**: configuration gloable applicable à toutes les webapps. L'installationpar defaut fournit:
    - un fichier de politique (catalina.policy) pour spécifier la politique de sécurité
    - deux fichiers de prpriétés: catalina.properties et logging.properties
    - 4 fichiers XML de configuration: server.xml (fichier de conf principal de tomcat), web.xml (descripteur global de déploiement d'application web), context.xml (options de configuration globales spécifiques à Tomcat), tomcat-users.xml (une base de données d'utilisateurs, de mots de passes et de rôles)
    - un répertoire conf contient également un sous-repertoire pour chaque moteur, par exemple Catalina, qui contient à son tour un sous-sous-repertoire pour chacun de ses hôtes, par exemple localhost. On peut y placer les informations de contexte spécifiques à l'hôte.
- **lib**: 
    - conserve les fichiers Jar qui sont disponibles pour toutes les applications web. L'installation par défaut comprend:
        - servlet-api.jar (servlet)
        - jasper.jar (JSP)
        - jasper-al.jar (EL)
    - On peut également conserver ici les fichiers JAR de paquets externes, comme les pilotes JDBC 
- logs: 
- temp
- webapps: 
    - le répertoire par défaut (appBase) de déploiement des applications web de l'hôte localhost
- work: 
    - contient les fichiers sources des servlets traduoits et les classes de JSP/JSF
    - organisé en hierarchie: moteur, hôte, webapp

```shell
# On copie (avec scp) le fichier jsp-hw.war sur le server
# On copie le fichier jsp-hw.war
sudo cp jsp-hw.war /usr/local/apache-tomcat-8.5/webapps/
# On se connect en tant que tomcat
sudo su - tomcat-8.5
# On lance le serveur
cd bin
./startup.sh
# Un jsp-hw (sans .war) est déployé
# http://192.168.44.134:8080/jsp-hw/
```

On peut faire une copie de jsp-hw en jsp-hw.1, supprimer jes jsp-hw et jsp-hw.war et renommer à nouveau jsp-hw.1 en jsp-hw...Cela évite le redéployement automatique à chaque démarrage. (?)

```bash
# On cree un dossier deploy dans /user/local/apache-tomcat-8.5
# On copie jsp-hw.war dedans
cp /home/poe/poe_download/jsp-hw.war /usr/local/apache-tomcat-8.5/deploy/
# On crée un fichier monappli.xml dans conf/Catalina/localhost
# On y ajoute la ligne
# contenant le lien vers le fichier war a deployer
# <Context path="" docBase="../deploy/jsp-hw.war">
```