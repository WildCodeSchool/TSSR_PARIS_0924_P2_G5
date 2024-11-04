#!/bin/bash

echo "Modification du mot de passe compte utilisateur"
read -s -p "Nouveau mot de passe : " mdp 
echo ""

if test -z "$mdp"; then
    echo "Le mot de passe ne peut pas être vide."
    exit 1  # Return a non-zero exit code for error
fi

read -s -p "Retapez le mot de passe (vérification) : " mdp2  
echo ""

if [ "$mdp" != "$mdp2" ]; then 
    echo "Les mots de passe saisis ne correspondent pas." 
    exit 1  # Return a non-zero exit code for error
fi

echo "Modification du mot de passe avec succès."
