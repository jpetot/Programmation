## ON FAIT TON MERCATO 

Tu en as marres de te faire choper Mbappé a 5 millions prêt ?   
Tu en as marres de miser que sur des joueurs qui plantent pas ?   
Tu finis toujours 8 ième de ta ligue ?   
Alors l'app __MPG mercato__ est faites pour toi !!  
Le but de ce projet est de faciliter ton mercato.   

On est parti du principe que Mon Petit Gazon est un jeu de data, tu ne peux que gagner en exploitant la data !!  

Le code est fonctionnel tel quel, ca te demande un peu de taff si tu veux update les données.

# Utilisation 

Pour utiliser cette App il te sufit de lancer les fichiers
-  ```global2.R``` , pense à mettre a jour la ligne ```setwd("~/Your/Directory/Projet_MPG")```  
- ```server.r``` 
- lance l'app (```runApp('server_ui')```)



## Repository structure

```
Projet_MPG
|
└─── README.md
|
└───mpg_stats_07_03.csv
    └───CSV file with MPG data before 07/03/2021
|
└───Global2 -> scripts that create table for the app
|
└───server_ui  
    │   server.r ->  App server 
    │   ui.r-> App Ui
    │   WWW : unimportant things to make the application more beautiful

```

## Requirements

installer les packages en tête de ```global2.R```, rien de bien sorcier.


## Data update 

Pour mettre a jour les données vous pouvez les recupérer sur ce site web :  

https://www.mpgstats.fr/top/Ligue-1/custom

Il vous suffit faire 6/7 copier coller du tableau (en affichage 100 éléments) dans un csv, il y a peut etre un peu de mise en forme a faire, notament enlever les apostrophes.

## info

Ce projet a été réalisé pour un projet App shiny pendant notre master. Il n'est donc pas parfait et pas souvent mis à jour, toutes Pull Request est la bienvenue pour améliorer le projet.


@jpetot https://www.linkedin.com/in/julien-petot-66899b177/    
@hchassag  
@baptiste  


