# -*- coding: utf-8 -*-

# ======================================================================================================================
# 1. Écrire un algorithme qui demande un entier à l’utilisateur, teste si ce nombre est positif (>= 0) ou non, et
# affiche “positif” ou “négatif”.
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande
# print("Entrez un entier:")
#
# # Capter l'entrée utilisateur et la convertir en entier
# user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
#
# # Tester le signe
# if(user_input >= 0): # L'entier est positif
#     print("L'entier est positif.")
# else: # L'entier est négatif
#     print("L'entier est négatif.")

# ======================================================================================================================
# 2. Écrire un algorithme qui demande un entier à l’utilisateur, teste si ce nombre est strictement positif, nul ou
# strictement négatif, et affiche ce résultat.
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande
# print("Entrez un entier:")
#
# # Capter l'entrée utilisateur et la convertir en entier
# user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
#
# # Tester le signe
# if(user_input > 0): # L'entier est positif
#     print("L'entier est strictement positif.")
# elif(user_input < 0): # L'entier est négatif
#     print("L'entier est strictement négatif.")
# else: # L'entier est nul
#     print("L'entier est nul.")

# ======================================================================================================================
# 3. Écrire un algorithme qui demande un réel à l’utilisateur et affiche sa valeur absolue (sans utiliser de fonction
# prédéfinie évidemment).
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande
# print("Entrez un entier:")
#
# # Capter l'entrée utilisateur et la convertir en entier
# user_input = int(input()) # Ou int(float(input()) si on veut convertir une entrée float en entier
#
# # Tester le signe
# if(user_input >= 0): # L'entier est positif
#     print("La valeur absolue de l'entier est:", user_input)
# else: # L'entier est négatif
#     print("La valeur absolue de l'entier est:", -1*user_input)

# ======================================================================================================================
# 4. Écrire un algorithme qui demande un réel à l’utilisateur et l’arrondit à l’entier le plus proche (les x,5 seront
# arrondis à l’entier supérieur).
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande
# print("Entrez un réel:")
#
# # Capter l'entrée utilisateur et la convertir en réel
# user_input = float(input())
#
# # Trouver l'entier le plus proche
# # On calcule le reste d'un modulo 1 et on teste
# if((user_input % 1) >= 0.5): # On arrondi à l'entier supérieur
#      arrondi = int(user_input // 1 + 1)
# else: # On arrondi à l'entier inférieur
#      arrondi = int(user_input // 1)
#
# print("L'entier le plus proche est: ", arrondi)

# ======================================================================================================================
# 5. Écrire un algorithme qui demande le numéro d’un mois et affiche le nombre jours que comporte ce mois (sans tenir
# compte des années bissextiles).
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande du numéro du mois
# print("Entrez un numéro de mois:")
#
# # Capter l'entrée utilisateur et la convertir en entier
# mois_input = int(input())
#
# if(mois_input == 1 or mois_input == 3 or mois_input == 5 or mois_input == 7 or mois_input == 8 or mois_input == 10 or mois_input == 12):
#     nb_jours = 31
# elif(mois_input == 2):
#     nb_jours = 28
# else:
#     nb_jours = 30
#
# print("Pour le mois numéro ", mois_input, " il y a", nb_jours, " jours.")

# ======================================================================================================================
# 6. Écrire un algorithme qui vérifie si une année est bissextile. On rappelle qu’il y a des années bissextiles tous les
# 4 ans, mais la première année d’un siècle ne l’est pas (1800, 1900 n’étaient pas bissextiles) sauf tous les 400 ans
# (2000 était une année bissextile).
# ----------------------------------------------------------------------------------------------------------------------

# # Affichage de la demande année
# print("Entrez une année:")
#
# # Capter l'entrée utilisateur et la convertir en entier
# annee_input = int(input())
#
# # L'année est bissextile si:
# # - si l'année est divisible par 4 (modulo nul) et non divisible par 100 (modulo non nul)
# # - si l'année est divisible par 400 (modulo nul)
# if((annee_input % 4 == 0 and annee_input % 100 != 0) or annee_input % 400 == 0):
#     print("C'est une année bissextile.")
# else:
#     print("Ce n'est pas une année bissextile.")

# ======================================================================================================================
# 7. Écrire un algorithme qui demande une date sous la forme de 2 nombres entiers (numéro du jour et numéro du mois)
# et affiche la saison (ex : 12/02; hiver). On supposera que le premier jour de la saison est toujours le 21.
# ----------------------------------------------------------------------------------------------------------------------

# Affichage de la demande mois
print("Entrez un numéro de mois:")

# Capter l'entrée utilisateur et la convertir en entier
mois_input = int(input())

# Affichage de la demande jour
print("Entrez un numéro de jour:")

# Capter l'entrée utilisateur et la convertir en entier
jour_input = int(input())

# Calcule du nombre de jours
numero_jour = 0
for imois in range(mois_input-1):
    if(imois+1 in [1, 3, 5, 7, 8, 10, 12]):
        numero_jour += 31
    elif (imois+1 == 2):
        numero_jour += 28
    else:
        numero_jour += 30
# Ajoute le numéro de date de jour
numero_jour += jour_input

# Chercher saison
if(numero_jour > 355  or numero_jour < 80 ):
    print("La saison est: hiver.")
if(numero_jour >= 80 and numero_jour < 172 ):
    print("La saison est: printemps.")
if(numero_jour >=172 and numero_jour < 264 ):
    print("La saison est: été.")
if(numero_jour >=264 and numero_jour < 355 ):
    print("La saison est: automne.")



