# -*- coding: utf-8 -*-

# Créer un nouveau fichier Exercice2.py dans votre projet et configurer le charset en utf-8
# En utilisant des boucles while lorsque le nombre d'itérations n'est pas connu et des boucles for lorsque le nombre d'itérations est connu :

# ======================================================================================================================
# 1. Écrire un algorithme qui demande un entier positif, et le rejette tant que le nombre saisi n’est pas conforme.
# ----------------------------------------------------------------------------------------------------------------------

# # # Cast/Check
# check = False
# while( check == False):
#     print("Entrez un entier (1):")
#     # Wait for user input
#     entree = input()
#     try:
#         entree_int = int(entree)
#         # Check if integer is positive or not
#         if entree_int > 0:
#             check = True
#         else:
#             print("Vous n'avez pas entré un entier positif")
#     except ValueError:
#         print("Vous n'avez pas entré un entier")
#
# print("Merci d'avoir entré l'entier positif {}".format(entree_int))

# ======================================================================================================================
# 2. Écrire un algorithme qui demande 10 entiers, compte le nombre d’entiers positifs saisis, et affiche ce résultat.
# ----------------------------------------------------------------------------------------------------------------------

# # Initialize the positive integer count
# number_of_positive = 0
# for ientry in range(10):
#     # Check entry
#     check_entry = False
#     # Loop while the entry is not an integer
#     while not(check_entry):
#         print("Veuillez entrer l'entier n°{}/10:".format(ientry+1))#.format(input_number+1))
#         # Wait for user input
#         entree = input()
#         try:
#             entree_int = int(entree)
#             check_entry = True
#             # Test if positive or not and increment
#             if entree_int > 0:
#                 number_of_positive += 1
#         except ValueError:
#             print("Vous n'avez pas entré un entier")
#
# print("Vous avez entré {} entiers positifs.".format(number_of_positive))

# ======================================================================================================================
# 3. Écrire un algorithme qui demande des entiers positifs à l’utilisateur, les additionne, et qui s’arrête en affichant
# le résultat dès qu’un entier négatif est saisi.
# ----------------------------------------------------------------------------------------------------------------------

# # Initialize sum of integer to zero
# somme = 0
# # Sum integers while entry is a positive (or zero) integer
# sum_again = True
# while(sum_again):
#     # Loop while the input is not an integer
#     check_entry = False
#     while not (check_entry):
#         print("Veuillez entrer un entier (3):")
#         # Wait for user input
#         entree = input()
#         try:
#             # Test conversion: str input to int
#             entree_int = int(entree)
#             check_entry = True
#             # Test if positive
#             if(entree_int >= 0):
#                 # Positive (or zero) integer
#                 somme += entree_int
#             else:
#                 # Negative integer
#                 sum_again = False
#         except ValueError:
#             print("Vous n'avez pas entré un entier")
#
# print("La somme des entiers positifs est de {}.".format(somme))

# ======================================================================================================================
# 4. Modifier ce dernier algorithme pour afficher la moyenne de la série d’entiers positifs saisis.
# ----------------------------------------------------------------------------------------------------------------------

# Initialize mean of integer to zero
moyenne = 0
# Initialize positive integer count to 0
nb_positive = 0
# Sum integers while entry is a positive (or zero) integer
mean_again = True
while(mean_again):
    # Loop while the input is not an integer
    check_entry = False
    while not (check_entry):
        print("Veuillez entrer un entier (3):")
        # Wait for user input
        entree = input()
        # Check if entree is an integer
        try:
            # Test conversion: str input to int
            entree_int = int(entree)
            check_entry = True
            # Test if positive
            if(entree_int >= 0):
                # Positive (or zero) integer
                moyenne += entree_int
                nb_positive += 1
            else:
                # Negative integer > Out of while loop
                mean_again = False
                # Calculate the mean
                moyenne /= nb_positive
        except ValueError:
            print("Vous n'avez pas entré un entier")

print("La moyenne des entiers positifs est de {}.".format(moyenne))