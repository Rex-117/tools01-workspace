# Deimons

<p>C'est un projet de github push et la création d'une repository</p>

## Le liste de commandes que j'apris par GitBash

Configuration du user
---

```bash
git config --global user.name "Ton Prénom Nom"
git config --global user.email "ton@email.com"
git config --global init.defaultBranch main
```

Initialisation du dépôt
---
```bash
mkdir mon-projet
cd mon-projet
git init
```

Le cycle add → commit
---
```bash
touch notes.md
echo "# Mon projet" > notes.md

git status

git add notes.md        
git add .               

git commit -m "ajout du fichier notes.md"
```

Connexion à GitHub, push et pull
---
```bash
git remote add origin https://example.git

git branch main

git branch master main

git push -u origin main

git push
git pull

git push origin main
git pull origin ma-branche
```
