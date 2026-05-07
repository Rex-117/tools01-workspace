#!/bin/bash
# Script pour demander des questions si c'est vrai ou faux avec un nombre de tentatives limité

q1="Quelle est la capitale de la France ?"
r1="Paris"
q2="Combien de continents y a-t-il sur Terre ?"
r2="7"
q3="Quel est le plus grand océan du monde ?"
r3="Pacifique"
q4="Quel est le plus grand pays du monde ?"
r4="Russie"
q5="Quel est le plus haut sommet du monde ?"
r5="Everest"
scr=0

echo "$q1"
read ur1

comparer_reponses() {
    if [ "$1" = "$2" ]; then
        scr=$(( $scr+1 ))
        echo "Correct! Ton score est maintenant $scr/5."
    else
        scr=$(( $scr-1 ))
        echo "Incorrect! Ton score est maintenant $scr/5."
    fi
}

comparer_reponses "$ur1" "$r1"

echo $q2
read ur2

comparer_reponses "$ur2" "$r2"

echo $q3
read ur3

comparer_reponses "$ur3" "$r3"

echo $q4
read ur4

comparer_reponses "$ur4" "$r4"

echo $q5
read ur5

comparer_reponses "$ur5" "$r5"

echo "le quiz est terminé!"
echo "Votre score final est $scr sur 5."

echo "Voulez-vous recommencer le quiz ? (Y/N)"
echo "Entrez votre réponse:"
read answer

if [ "$answer" = "Y" ]
then
    # relancer le quiz
    bash 5\ questions.sh
else
    echo "Merci d'avoir joué!"
fi

# if [ "$ur2" = "$r2" ]; then
#     $scr=$(( $scr+1 ))
#     echo "Correct! Votre score est maintenant $scr."
# else
#     echo "Incorrect! Ton score est maintenant $scr."
# fi

# q3="Quel est le plus grand océan du monde ?"
# r3="Pacifique"

# if [ "$ocean" = "$r3" ]
# then echo "Correct!"
# else echo "Incorrect! La bonne réponse est $r3."
# fi

# q4="Quel est le plus grand pays du monde ?"
# r4="Russie"

# if [ "$country" = "$r4" ]
# then echo "Correct!"
# else echo "Incorrect! La bonne réponse est $r4."
# fi

# q5="Quel est le plus haut sommet du monde ?"
# r5="Everest"

# if [ "$mountain" = "$r5" ]
# then echo "Correct!"
# else echo "Incorrect! La bonne réponse est $r5."
# fi



