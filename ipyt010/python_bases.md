# Python: Les bases

```
Dans le document, le triple chevron `>>>` indique la sortie attendue.
```

## En bref

- Python a été créé en 1990 par Guido van Rossum. Il a écrit la première version du langage lors d'une semaine devacances durant les fêtes de Noël de 1989. Grand amateur des _Monty Python_, il décide de nommer son langage _Python_.

- _Python_ est un langage interprété et dynamiquement typé: il n'est pas compilé et il détermine, à la volée, les types associés aux variables et aux objets.

- _Python_ utilise l'indentation pour organiser les blocs de code et créer un code lisible.

- _Python_ vient avec un ensemble de modules (librairie standard) extrêmement importante et variée dans les applications (math, parseur xml, mesure du temps, contrôle du système d'exploitation, hashage etc.).

- _Python 2_ n'est plus maintenu depuis Janvier 2020, ce sont donc les versions _Python 3.X_ qu'il faut utiliser.

## 1-Hello World!

Comparé à d'autres langages de programmation, le Python est relativement simple. L'exemple typique consistant à afficher le message "Hello world!" est produit avec la ligne de code suivante:

```Python
print("Hello world!")
>>> Hello world!
```

La fonction `print()` utilisée ici est une fonction interne de Python qui permet d'afficher aussi bien du texte (entre quotes) que le contenu des variables.

## 2- Les opérateurs

Python dispose de tous les opérateurs standards.

```Python
# Addition
3 + 2
>>> 5
```

```Python
# Soustraction
3 - 2
>>> 1
```

```Python
# Multiplication
3 * 2
>>> 6
```

```Python
# Division
3 / 2
>>> 1.5
```

```Python
# Division entière
3 // 2
>>> 1
```

```Python
# Modulo
3 % 2
>>> 1
```

```Python
# Puissance
3 ** 2
>>> 9
```

Python suit les priorités classiques des mathématiques i.e, les multiplications sont prioritaires sur les additions, les opérations entre parenthèses sont prioritaires etc.

```Python
1 + 2 * 3
>>> 7
```

```Python
(1 + 2) * 3
>>> 9
```

## 3-Les variables

Une variable est un emplacement mémoire auquel on attache un nom qui permettra de facilement y accéder. En Python, on préfèrera des noms de variables le plus explicite possible et en minuscules.

```Python
#variable 1
var1 = 1

# variable voiture
voiture = "automobile"

# variable taux
taux = 1.2365897421
```

On peut faire des opérations sur les variables et assigner le resultat à une autre variable:

```Python
# variables 1, 2 & 3
var1 = 12.
var2 = -5
var3 = 42

# Operations
resultat = var1 + var2 * var3
print(resultat)
>>> -198.0
```

**/!\ Attention aux affectations de variables**

```Python
var1 = 11
# Là on va écraser la première valeur affectée
var1 = 22
print(var1)
>>> 22
```

De la même façon

```Python
# Idem ici
var1 = 11
var2 = 22
var1 = var2
print(var1)
>>> 22
```

## 4-Les types de données

Les principaux types de données en Python sont les suivant:
- **int**: les entiers
- **float**: les réels
- **complex**: les complexes
- **bool**: les booléens prennent les valeurs `True` ou `False`

```Python
# Integers
# il n'y a pas de point après le chiffre, il sera considéré par défaut comme un entier
i1 = 1
i2 = -3
i3 = 0
print(i1, i2, i3)
>>> 1 -3 0
```

```Python
# Float
# il y a un point à la fin ou dans le nombre, il sera considéré par défaut comme un float
f1 = 1.456987
f2 = -3.4
f3 = 0.
print(f1, f2, f3)
>>> 1.456987 -3.4 0.0
```

```Python
# Complex
#Les complexes utilisent la lettre 'j' pour marquer la partie imaginaire
c1 = 1.0+4.j
c2 = 0.+27j
c3 = 56.+0j
print(c1, c2, c3)
>>> (1+4j) 27j (56+0j)
```

```Python
# Bool
vrai = True
faux = False
print(vrai, faux)
>>> True False
```

## 5-Les chaînes de caractères
