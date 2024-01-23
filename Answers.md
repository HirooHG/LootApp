# Answers

> Answers to the questions

## 2-AppBasics

### 1
Il manque des identifiant pour les items pour différencier les items les un des autres

### 2
Ajout d'un bouton en premier item pour ajouter l'item Magie de feu dans la liste
boucle foreach pour loop sur les items et les ajouter après le bouton

### 3
Le code ne fonctionne pas puisque le binding de loot est immutable puisqu'il est dans une structure, il ne fait pas parti de l'état, il ne peut être changé
Il faut le changer en @State pour que l'état prenne en compte le changement

## 4-AddItem
### 1
Il n'ajoute pas l'item puisque l'objet n'est pas observable, l'état n'est pas prévenu que ces propriétés sont mutable
### 2
L'objet et ces propriétés font parti de l'état, lors d'un changement, la page refresh
StateObject est la fusion des deux State et ObservedObject

