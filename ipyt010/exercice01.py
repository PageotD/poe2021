# -*- coding: utf-8 -*-

# ======================================================================================================================
# 1. Écrire un algorithme qui demande un entier à l’utilisateur, teste si ce nombre est positif (>= 0) ou non, et
# affiche “positif” ou “négatif”.
# ----------------------------------------------------------------------------------------------------------------------
# # Cast/Check
# check = False
# while( check == False):
#
#     print("Entrez un entier (1):")
#     # Wait for user input
#     entree = input()
#
#     try:
#         entree_int = int(entree)
#         check = True
#     except ValueError:
#         print("Vous n'avez pas entré un entier")
#
# #Evaluation
# if(entree_int >= 0):
#     print("positif")
# else:
#     print("négatif")

# ======================================================================================================================
# 2. Écrire un algorithme qui demande un entier à l’utilisateur, teste si ce nombre est strictement positif, nul ou
# strictement négatif, et affiche ce résultat.
# ----------------------------------------------------------------------------------------------------------------------
# # Initialize check input
# check = False
# # User's input required while "entree" is not an integer
# while(check == False):
#     print("Entrez un entier (2):")
#     # Wait for user input
#     entree = input()
#
#     # Check if entree is an integer
#     try:
#         # Convert entree (str) to entree_int (int)
#         entree_int = int(entree)
#         check = True
#     except ValueError:
#         # entree is not an integer
#         print("Vous n'avez pas entré un entier")
#
# #Evaluation
# if(entree_int > 0):
#     # entree_int is strictly positive
#     print("strictement positif")
# elif(entree_int < 0):
#     # entree_int is strictly negative
#     print("strictement négatif")
# else:
#     # entree_int is zero
#     print("nul")

# ======================================================================================================================
# 3. Écrire un algorithme qui demande un réel à l’utilisateur et affiche sa valeur absolue (sans utiliser de fonction
# prédéfinie évidemment).
# ----------------------------------------------------------------------------------------------------------------------
# # Initialize check input
# check = False
# # User's input required while "entree" is not a float
# while(check == False):
#     print("Entrez un réel (3):")
#     # Wait for user input
#     entree = input()
#
#     # Check if entree is an digit
#     try:
#         # Convert entree (str) to entree_int (int)
#         entree_float = float(entree)
#         check = True
#     except ValueError:
#         # entree is not an integer
#         print("Vous n'avez pas entré un réel")
#
# #Evaluation
# if(entree_float >= 0):
#     # entree_float is positive
#     entree_float_abs = entree_float
# else:
#     # entree_float is negative
#     entree_float_abs = -1.*entree_float
# print("La valeur absolue de {} est: {}.".format(entree_float, entree_float_abs))

# ======================================================================================================================
# 4. Écrire un algorithme qui demande un réel à l’utilisateur et l’arrondit à l’entier le plus proche (les x,5 seront
# arrondis à l’entier supérieur).
# ----------------------------------------------------------------------------------------------------------------------
# # Initialize check input
# check = False
# # User's input required while "entree" is not a float
# while(check == False):
#     print("Entrez un réel (4):")
#     # Wait for user input
#     entree = input()
#
#     # Check if entree is an digit
#     try:
#         # Convert entree (str) to entree_int (int)
#         entree_float = float(entree)
#         check = True
#     except ValueError:
#         # entree is not an integer
#         print("Vous n'avez pas entré un réel")
#
# # Closest integer
# if((entree_float % 1) >= 0.5):
#     arrondi = int(entree_float // 1 + 1)
# else:
#     arrondi = int(entree_float // 1)
#
# print("L'entier le plus proche de {} est {}.".format(entree_float, arrondi))

# ======================================================================================================================
# 5. Écrire un algorithme qui demande le numéro d’un mois et affiche le nombre jours que comporte ce mois (sans tenir
# compte des années bissextiles).
# ----------------------------------------------------------------------------------------------------------------------
# # Initialize check input
# check = False
# # User's input required while "entree" is between 1 and 12
# while(check == False):
#     print("Entrez un mois (5):")
#     # Wait for user input
#     entree = input()
#
#     # Check if entree is an integer between 1 and 12
#     try:
#         # Convert entree (str) to entree_int (int)
#         mois = int(entree)
#         if( mois >= 1 and mois <= 12):
#             check = True
#         else:
#             print("mois doit être compris entre 1 et 12.")
#     except:
#         # entree is not an integer
#         print("Vous n'avez pas entré un numéro de mois.")
#
# if(mois in [1, 3, 5, 7, 8, 10, 12]):
#     nb_jours = 31
# elif(mois == 2):
#     nb_jours = 28
# else:
#     nb_jours = 30
#
# print("Pour le mois numéro {} il y a {} jours.".format(mois, nb_jours))

# ======================================================================================================================
# 6. Écrire un algorithme qui vérifie si une année est bissextile. On rappelle qu’il y a des années bissextiles tous les
# 4 ans, mais la première année d’un siècle ne l’est pas (1800, 1900 n’étaient pas bissextiles) sauf tous les 400 ans
# (2000 était une année bissextile).
# ----------------------------------------------------------------------------------------------------------------------
# # Initialize check input
# check = False
# # User's input required while "entree" is not an integer
# while(check == False):
#      print("Entrez un année (6):")
#      # Wait for user input
#      entree = input()
#
#      # Check if entree is an integer
#      try:
#          # Convert entree (str) to entree_int (int)
#          annee = int(entree)
#          check = True
#      except:
#          # entree is not an integer
#          print("Vous n'avez pas entré un entier.")
#
# # L'année est bissextile si:
# # - si l'année est divisible par 4 (modulo nul) et non divisible par 100 (modulo non nul)
# # - si l'année est divisible par 400 (modulo nul)
# if((annee % 4 == 0 and annee % 100 != 0) or annee % 400 == 0):
#     print("{} est une année bissextile.".format(annee))
# else:
#     print("{} n'est pas une année bissextile.".format(annee))

# ======================================================================================================================
# 7. Écrire un algorithme qui demande une date sous la forme de 2 nombres entiers (numéro du jour et numéro du mois)
# et affiche la saison (ex : 12/02; hiver). On supposera que le premier jour de la saison est toujours le 21.
# ----------------------------------------------------------------------------------------------------------------------

# Initialize check input
check_mois = False
check_jour = False

# User's input required while "entree" is between 1 and 12
while(check_mois == False):
    print("Entrez un mois (5):")
    # Wait for user input
    entree = input()

    # Check if entree is an integer between 1 and 12
    try:
        # Convert entree (str) to mois (int)
        mois = int(entree)
        if( mois >= 1 and mois <= 12):
            check_mois = True
        else:
            print("mois doit être compris entre 1 et 12.")
    except:
        # entree is not an integer
        print("Vous n'avez pas entré un numéro de mois.")

# User's input required while "entree" is between 1 and 12
while(check_jour == False):
    print("Entrez un jour (5):")
    # Wait for user input
    entree = input()

    # Check if entree is an integer between 1 and 12
    try:
        # Convert entree (str) to jour (int)
        jour = int(entree)
        if(mois in [1, 3, 5, 7, 8, 10, 12] and (jour<1 or jour > 31)):
            print("Pour le mois numero {}, les jours vont de 1 à 31".format(mois))
        elif(mois == 2 and (jour<1 or jour > 28)):
            print("Pour le mois numero {}, les jours vont de 1 à 28".format(mois))
        elif(mois in [4, 6, 9, 11] and (jour<1 or jour > 30)):
            print("Pour le mois numero {}, les jours vont de 1 à 30".format(mois))
        else:
            check_jour = True
    except:
        # entree is not an integer
        print("Vous n'avez pas entré un numéro de jour.")

# Calculate day id
numero_jour = 0
for imois in range(mois-1):
    if(imois+1 in [1, 3, 5, 7, 8, 10, 12]):
        numero_jour += 31
    elif (imois+1 == 2):
        numero_jour += 28
    else:
        numero_jour += 30

# Add the day
numero_jour += jour

# Check
if(numero_jour > 355  or numero_jour < 80 ):
    print("Au jour {} du mois {}, la saison est: hiver.".format(jour, mois))
if(numero_jour >= 80 and numero_jour < 172 ):
    print("Au jour {} du mois {}, la saison est: printemps.".format(jour, mois))
if(numero_jour >=172 and numero_jour < 264 ):
    print("Au jour {} du mois {}, la saison est: été.".format(jour, mois))
if(numero_jour >=264 and numero_jour < 355 ):
    print("Au jour {} du mois {}, la saison est: automne.".format(jour, mois))



