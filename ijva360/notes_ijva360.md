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
mkdir -p tomcat_install
cd tomcat_install
wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz.sha512
```