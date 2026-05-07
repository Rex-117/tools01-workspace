#!/bin/bash

set -e # pour arrêter le script en cas d'erreur

function commentaire() {
    echo "Mode d'emploi: $0 <message de commit> [nom de branche]"
    echo "Exemple: $0 'Correction de bug' X main"
    exit 1
    commentaire
}

if [ -z "$1" ]; then
    echo "[Erreur] Commit message manquant"
    exit 1
fi

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "[Erreur] Ce script doit être exécuté à l'intérieur d'un dépôt Git."
    exit 1
fi

commit_msg="$1"
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# ajout des fichier au commit
git add -A

#commit lui-meme
git commit -m "$commit_msg"

#push
git push origin "$BRANCH"

#Confirmation de succès
echo "Succès! Votre commit a été poussé sur la branche $BRANCH avec le message: '$commit_msg'"