# -*- coding: utf-8 -*-

# Créer un nouveau fichier Exercice2.py dans votre projet et configurer le charset en utf-8
# En utilisant des boucles while lorsque le nombre d'itérations n'est pas connu et des boucles for lorsque le nombre d'itérations est connu :

# ======================================================================================================================
# 1. Écrire un algorithme qui demande un entier positif, et le rejette tant que le nombre saisi n’est pas conforme.
# ----------------------------------------------------------------------------------------------------------------------

# # Boucle tant que l'entier n'est pas positif
# # On initialise user_input à -1 pour satisfaire la condition du while et entrer dans la boucle
# user_input = -1
# while(user_input < 0):
#     # Affichage de la demande
#     print("Entrez un entier positif:")
#     # Capter l'entrée utilisateur et la convertir en entier
#     user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
#     # Message d'alerte
#     if(user_input < 0):
#         print("L'entier n'est pas positif.")
#
# # On est sorti de la boucle car on ne satisfait plus la condition
# print("Vous avez entré un entier positif.")

# ======================================================================================================================
# 2. Écrire un algorithme qui demande 10 entiers, compte le nombre d’entiers positifs saisis, et affiche ce résultat.
# ----------------------------------------------------------------------------------------------------------------------

# # On initialise le comptage
# compte = 0
# # On boucle sur 10 itération pour obtenir les 10 chiffres
# for ientier in range(10):
#     # Affichage de la demande
#     print("Entrez l'entier ", ientier+1,"/10 :")
#     # Capter l'entrée utilisateur et la convertir en entier
#     user_input = int(input())  # Ou int(float(input()) si on veut convertir une entrée float en entier
#     # Comptabilisation des entiers positifs
#     if (user_input > 0):
#        compte += 1
#
# print("Vous avez entré ", compte, " entiers positifs.")

# ======================================================================================================================
# 3. Écrire un algorithme qui demande des entiers positifs à l’utilisateur, les additionne, et qui s’arrête en affichant
# le résultat dès qu’un entier négatif est saisi.
# ----------------------------------------------------------------------------------------------------------------------

# # On initialise la somme
# somme = 0
# # Boucle tant que l'entier est positif
# # On initialise user_input à -1 pour satisfaire la condition du while et entrer dans la boucle
# user_input = 0
# while(user_input >= 0):
#     # Affichage de la demande
#     print("Entrez un entier:")
#     # Capter l'entrée utilisateur et la convertir en entier
#     user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
#     # Message d'alerte
#     if(user_input >= 0):
#         somme += user_input
#
# # On est sorti de la boucle car on ne satisfait plus la condition
# print("La somme des entiers positifs est de:", somme, " .")

# ======================================================================================================================
# 4. Modifier ce dernier algorithme pour afficher la moyenne de la série d’entiers positifs saisis.
# ----------------------------------------------------------------------------------------------------------------------

# On initialise la moyenne et le comptage des entiers positifs
moyenne = 0
compte = 0
# Boucle tant que l'entier est positif
# On initialise user_input à -1 pour satisfaire la condition du while et entrer dans la boucle
user_input = 0
while(user_input >= 0):
    # Affichage de la demande
    print("Entrez un entier:")
    # Capter l'entrée utilisateur et la convertir en entier
    user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
    # Message d'alerte
    if(user_input >= 0):
        moyenne += user_input
        compte += 1
    else:
        moyenne /= compte

# On est sorti de la boucle car on ne satisfait plus la condition
print("La moyenne des entiers positifs est de:", moyenne, " .")