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

## Structure

_Python_ utilise l'indetation pour délimiter les blocs de contrôle et les boucles. Cela permet une meilleure lisibilité mais il faut cependant faire attention à l'alignement des différents blocs: un déséquilabrage entraînera soit une erreur, soit un résultat non-souhaité.

```Python
def fonctionA():
    # On met ici des commentaires ou instructions
    # Ici aussi
    # Et pourquoi pas là
    # Et on va faire une boucle
    for i in range(0, n):
        # On met ici des commentaires ou instructions
        # Ici aussi
        # Et pourquoi pas là
        # Et on ressort de la boucle en décalant l'indentation sur la gauche
    print("On est sorti de la boucle mais on est toujours dans la fonction A")

# En s'alignant avec def fonctionA, on ressort de fonctionA
# On peut commencer une nouvelle fonction    
def fonctionB():
    # On met ici des commentaires ou instructions
    # Ici aussi
    # Et pourquoi pas là
```

Les **commentaires** en _Python_ sont très simples. Toute ligne commencant par un `#` est une ligne de commentaire (cf exemple ci-dessus).

Les **docstring** en _Python_ sont des commentaires dédiés à la documentation de code. A ce titre, ils n'utilisent pas les `#` mais des triples quotes `'''`

```Python
def fonctionA():
    '''
    Ceci est une description de la fonctionA.
    Elle sert d'exemple.
    Et à rien d'autre.

    C'est pourquoi il n'y a que des commentaires.
    '''
    # On met ici des commentaires ou instructions
    # Ici aussi
    # Et pourquoi pas là
    # Et on va faire une boucle
```

En général, on tendra à écrire les commentaires sur une seule ligne, ou du moins à ajouter un `#` à chaque ligne de commentaire. Les **docstring** en revanche sont fait pour permettre d'écrire plusieurs lignes entre les triples quotes.

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

Les chaînes de caractères (**str**) sont des objets très utilisés et _Python_ fournit de nombreux outils pour les manipuler. Les chaînes de caractères peuvent être définies à l'aide de guillemets simples ou doubles.

```python
chaine1 = 'Hello world! (1)'
chaine1 = "Hello world! (2)"
print(chaine1)
>>> Hello world (1)!
print(chaine2)
>>> Hello world (2)!
```

Les chaînes de caractères supportent les caractères d'échappement, par exemple `\"`, et les sauts de ligne `\n`.

```python
chaine1 = 'Afficher guillemets \"'
chaine2 = 'Saut de ligne \n nouvelle ligne.'
print(chaine1)
>>> Afficher guillemets "
print(chaine2)
>>> Saut de ligne
>>> Nouvelle ligne
```

Il est également possible de concatener des chaînes de caractères à l'aide de l'opérateur `+`. Les autres opérateurs ne sont pas utilisables entre chaînes de caractères. On ne peut concatener une chaîne de caractères qu'avec une autre chaîne de caractères.

```Python
chaine1 = "Hello "
chaine2 = "world!"
chaine_tot = chaine1 + chaine2
print(chaine_tot)
>>> Hello world!
```

## 6-Les conversions de type

En _Python_, il est possible de passer d'un type de données à un autre par conversion. Pour cela, on utilise des fonctions qui ont le nom du type cible(`int()`, `float()`, `complex()` et `str()`).

```Python
var_float = 1.0 # c'est un float
var_int = int(var_float) # On converti vers le type int

var_float2 = float(var_int) # On converti vers le type float

chaine1 = '12'
chaine_to_int = int(chaine1)

var_int = 12
int_to_chaine = str(var_int)

annee = 2021
chaine = "Nous sommes dans la POE de "+str(annee)+"."
print(chaine)
>>> Nous sommes dans la POE de 2021.
```

Attention, il n'est pas possible de convertir n'importe quel type vers n'importe quel autre.
L'exemple ci-dessous renverra une erreur.

```Python
var_float = float("Hello world!")
```
