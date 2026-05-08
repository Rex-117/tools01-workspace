#!/bin/bash

# ============================================================
#  GENERATEUR DE RAPPORT DE FORMATION
#  Exercice participant -- Semaine 3
#  Initiative Avenir | Cybercap
#
#  Objectif : creer un script qui pose des questions
#  a l'utilisateur et genere un fichier .md structure.
#
#  Notions utilisees :
#    - variables
#    - read
#    - fonctions
#    - if-elif-else
#    - boucle while
#    - tableaux
#    - cat << EOF  (nouvelle notion !)
# ============================================================


# -----------------------------------------------
# ETAPE 1 : VARIABLES GLOBALES
# Declare toutes tes variables ici.
# Le tableau "apprentissages" est déjà déclaré
# pour toi -- c'est la syntaxe pour un tableau vide.
# -----------------------------------------------

nom=""
semaine=""
date_rapport=""
Apprentissages=()    # tableau vide -- on le remplira plus tard
defi=""
approfondir=""
note=0
etoiles=""
notes_perso=""
nom_fichier=""


# -----------------------------------------------
# ETAPE 2 : FONCTION convertir_etoiles
#
# Cette fonction recoit un chiffre entre 1 et 5
# et assigne la bonne chaine d'etoiles a la
# variable globale "etoiles".
#
# Exemple : si note = 3, etoiles = "⭐⭐⭐ (3/5)"
#
# Utilise if / elif / else pour couvrir les cas
# 1, 2, 3, 4, 5, et un cas invalide.
# -----------------------------------------------

convertir_etoiles() {
    local note="$1"

    if [ "$note" -eq 1 ]; then
        etoiles="⭐ (1/5)"
    elif [ "$note" -eq 2 ]; then
        etoiles="⭐⭐ (2/5)"
    elif [ "$note" -eq 3 ]; then
        etoiles="⭐⭐⭐ (3/5)"
    elif [ "$note" -eq 4 ]; then
        etoiles="⭐⭐⭐⭐ (4/5)"
    elif [ "$note" -eq 5 ]; then
        etoiles="⭐⭐⭐⭐⭐ (5/5)"
    else
        etoiles="Note invalide"
    fi
}


# -----------------------------------------------
# ETAPE 3 : FONCTION collecter_apprentissages
#
# Cette fonction utilise une boucle "while true"
# pour demander des apprentissages un par un.
#
# A chaque tour :
#   1. Lire une entree avec "read"
#   2. Si l'entree est "fin", sortir de la boucle
#   3. Sinon, ajouter l'entree au tableau
#
# Pour ajouter un element a un tableau :
#   mon_tableau+=("nouvel element")
#
# Pour sortir d'une boucle while : "break"
# -----------------------------------------------

collecter_apprentissages() {
    echo "Entre tes apprentissages un par un."
    echo "Tape 'fin' quand tu as termine."
    echo ""

    while true; do
        read -p "Apprentissage : " item

        # Si l'utilisateur tape "fin", sortir de la boucle
        if [ "$item" = "fin" ]; then
            break
        fi

        # Ajouter l'item au tableau si non vide
        # CONSEIL : [ -n "$item" ] verifie que la chaine n'est pas vide
        if [ -n "$item" ]; then
            apprentissages+=("$item")
        fi
    done
}


# -----------------------------------------------
# ETAPE 4 : FONCTION generer_rapport
#
# C'est ici qu'on utilise "cat << EOF" pour
# ecrire le fichier markdown.
#
# NOUVELLE NOTION : cat << EOF
# Tout ce qui est entre EOF et EOF est ecrit
# tel quel dans le fichier. Les variables sont
# interpolees normalement.
#
#   cat > "mon-fichier.md" << EOF
#   # Titre : $variable
#   Contenu libre ici
#   EOF
#
# Pour le nom du fichier, on utilise le nom
# du participant et le numero de semaine.
# -----------------------------------------------

generer_rapport() {
    nom_fichier="rapport-semaine${semaine}-${nom// /-}.md"

    # Construire la liste des apprentissages en markdown
    # Cette boucle for convertit le tableau en liste markdown
    liste_md=""
    for apprentissage in "${apprentissages[@]}"; do
        liste_md="${liste_md}- ${apprentissage}"$'\n'
    done

    # COMPLETER ICI avec cat << EOF
    # Utilise tes variables pour remplir le rapport
    cat > "$nom_fichier" << EOF
# Rapport de formation -- Semaine $semaine

**Participant :** $nom
**Date :** $date_rapport

---

## Ce que j'ai appris cette semaine

$liste_md
---

## Auto-evaluation

Niveau de confiance : $etoiles

---

## Mon plus grand defi

$defi

---

## Ce que je veux approfondir

$approfondir

---

## Notes personnelles

$notes_perso

---

*Rapport genere automatiquement via script Bash -- Initiative Avenir | Cybercap*
EOF
}


# -----------------------------------------------
# ETAPE 5 : PROGRAMME PRINCIPAL
#
# C'est ici que tout s'assemble.
# Suis les commentaires dans l'ordre.
# -----------------------------------------------

clear
echo ""
echo "========================================"
echo "  GENERATEUR DE RAPPORT DE FORMATION"
echo "========================================"
echo ""

# Collecter les infos de base avec read
read -p "Ton prenom et nom : " nom
read -p "Numero de la semaine : " semaine
read -p "Date d'aujourd'hui (ex. 2024-11-15) : " date_rapport

echo ""
echo "========================================"
echo ""

# Appeler la fonction pour collecter les apprentissages
# COMPLETER ICI

collecter_apprentissages

echo ""
echo "========================================"
echo ""

# Collecter le defi et ce qu'on veut approfondir
read -p "Ton plus grand defi cette semaine : " defi
read -p "Ce que tu veux approfondir : " approfondir

echo ""
echo "========================================"
echo ""

# Collecter la note et appeler convertir_etoiles
read -p "Ton niveau de confiance (1 a 5) : " note
convertir_etoiles "$note"

echo ""
echo "========================================"
echo ""

# Collecter les notes personnelles
read -p "Tes commentaires libres : " notes_perso

echo ""
echo "========================================"
echo ""

# Generer le rapport
echo "Generation du rapport en cours..."
generer_rapport

# Afficher un message de confirmation
echo ""
echo "[OK] Rapport genere : $nom_fichier"
echo ""
echo "Pour le consulter :"
echo "  cat $nom_fichier"
echo ""
echo "========================================"
echo ""


# -----------------------------------------------
# DEFIS BONUS (si tu termines avant les autres)
# -----------------------------------------------

# BONUS 1 : Ajoute des couleurs dans le terminal
#   pour les titres de section et les messages [OK]

# BONUS 2 : Valide que la note est bien entre 1 et 5
#   avant d'appeler convertir_etoiles
#   Indice : utilise -lt et -gt dans ton if

# BONUS 3 : Affiche un resume dans le terminal
#   avant de generer le fichier et demande
#   une confirmation : "Generer le rapport ? (o/n)"

# BONUS 4 : Ajoute le nombre d'apprentissages
#   dans le rapport markdown
#   Indice : ${#apprentissages[@]} donne la longueur d'un tableau
