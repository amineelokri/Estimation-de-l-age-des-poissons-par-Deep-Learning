import os
import pandas as pd 

# Ici on va lire la base de données originale afin de ne pas avoir à la lire à chaque fois
data = pd.read_csv('./metadata_plaice_2010-2019.csv', delimiter=";")

# Cette fonction permet de trouver la ligne dans data correspondant à une image puis de l'ajouter dans une liste 
def remplir(data1, value):
    d = data['Reference_PC'] == value  # Ici on vérifie la référence et le nom de l'image, il renvoie une liste booléenne 

    j = 0
    for i in d:  # Dans cette phase, on veut récupérer l'index de l'image dans la base de données originale
        if i:
            break
        j = j + 1
    print(j)
    print(value)
    # Lorsque on trouve l'index de l'image, on veut l'ajouter dans une liste, cette liste va être transférée à une DataFrame puis à un CSV
    if i:
        data1.append([data.iloc[j]['Reference_PC'], data.iloc[j]['Age']])  # On ajoute seulement la référence et l'âge
    
# Chemin du dossier des images des otolithes droites
dossier = './right/'
# Chemin du nouveau base de données qui contient que les otolithes droites
destination_csv = './right_data.csv'
# Initialisation de la liste qui contient les informations des otolithes droites
datas = []
# Ici on récupère le nom des images des otolithes droites
for fichier in os.listdir(dossier):
    chemin_fichier = os.path.join(dossier, fichier)
    if os.path.isfile(chemin_fichier) and fichier[-3:]=='tif':
        remplir(datas, fichier[:-4])  # Le nom de l'image se termine par .tif
    
my_data = pd.DataFrame(datas)  # Ici on transfère la liste à une DataFrame
print(my_data)
my_data.columns = ["Reference_PC", "Age"]  # On ajoute les noms des colonnes
# Finalement on transfère la DataFrame en CSV
my_data.to_csv(destination_csv, index=False)
print("Done")