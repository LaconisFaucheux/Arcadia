# Application Zoo Arcadia - Partie Back

La partie Back (API) du projet Arcadia a été réalisé avec [ASP.NET 8](https://github.com/dotnet/aspnetcore).

## IDE

Ce projet a été réalisé avec les IDE VS Code, Visual Studio 2022 et Rider (JetBrains).

## Déploiement local

### PRE REQUIS

#### Logiciels

Installation de [Git](https://github.com/LaconisFaucheux/ECF_Zoo)
Installation de [Visual Studio 2022](https://visualstudio.microsoft.com/fr/vs/) et plus particulièrement de la charge de travail `ASP.NET`.
Installation de [SQL Server](https://www.microsoft.com/fr-fr/sql-server/sql-server-downloads)

### ETAPES

1. Clonez le repo.
2. Sous Visual Studio 2022, ouvrez la `Console du Gestionnaire de Package`
3. Exécutez la commande `update-database -Context AuthDbContext` pour exécuter les migrations correspondant à la partie utilisateurs
4. Exécutez la commande `update-database -Context ContextArcadia` pour exécuter les migrations correspondant à la partie zoo
5. Ouvrez le fichier `Migrations\Dataset.sql`
6. Cliquez sur l'icône `Connexion` en haut à gauche, puis sélectionnez la base de données `Arcadia`
7. Exécutez le script SQL (triangle vert en haut à gauche de l'onglet). Le jeu de données est créé et inséré dans la BDD.
8. Pressez `Alt + F5` pour démarrer l'API.
9. Testez vos requêtes avec Swagger. N'oubliez pas de récupérer le token JWT pour les endpoints protégés.

# Application Zoo Arcadia - Partie Front

La partie Front du projet Arcadia a été réalisé avec [Angular CLI](https://github.com/angular/angular-cli) version 18.0.4.

## IDE

Ce projet a été réalisé avec les IDE VS Code et Webstorm (JetBrains).

## Déploiement local

### PRE REQUIS

#### Logiciels

Installation de [Git](https://github.com/LaconisFaucheux/ECF_Zoo)
Installation de [Node.js](https://nodejs.org/en/download/package-manager/current) et plus particulièrement de npm.
Installation d'Angular CLI avec la commande `npm install -g @angular/cli`

La partie Front fonctionnera en tant que telle mais la quasi totalité des fonctionnalité sera inutilisable dans l'[API Arcadia](https://github.com/LaconisFaucheux/ECF_Zoo)

### ETAPES

1. Cloner le repo: `git clone https://github.com/LaconisFaucheux/ArcadiaFrontECF.git`
2. Exécuter la commande `npm install` dans le repo
3. Exécuter la commande `ng serve` dans le repo
4. Votre application est prête à être testée à l'URL [localhost:4200](https://localhost:4200)
