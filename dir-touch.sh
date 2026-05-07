#!/bin/bash
# Un script pour creer des directories et toucher des fichiers dans ces directories avec les messages d'erreur ou de succes

# La fonction de messages d'erreur et de succès

message() {
    if [ $1 -eq 0 ]; then
        echo "Succès: $2"
    else
        echo "Erreur: Quelque chose s'est mal passé avec $2"
    fi
}

# Créer des directories et subdirectories
mkdir -p workspace/{projets/{web,scripts},notes,ressources}
message $? "Directories créés avec succès."

# Toucher les fichiers README.txt dans les directories et subdirectories
touch workspace/README.txt
touch workspace/projets/README.txt
touch workspace/projets/web/README.txt
touch workspace/projets/scripts/README.txt
touch workspace/notes/README.txt
touch workspace/ressources/README.txt
message $? "Fichiers README.txt créés avec succès dans les directories."

# Copie ton fichier README.txt du dossier notes/ vers le dossier ressources/
cp workspace/notes/README.txt workspace/ressources/info.txt
message $? "Fichier README.txt copié avec succès vers ressources/info.txt."