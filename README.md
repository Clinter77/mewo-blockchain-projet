# Verrouillage temporel - React + TypeScript + Vite + Solidity

### Introduction

Ce projet implique la création d'un smart contract permettant aux utilisateurs de déposer de l'Ether qui ne peut être retiré qu'après une période de temps spécifiée, par exemple 7 jours. Cette fonctionnalité de verrouillage temporel offre une approche pratique pour explorer les mécanismes de contrôle du temps et de gestion des fonds dans les smart contracts. Ce type de contrat peut être utilisé pour des applications telles que l'épargne, la planification financière ou même comme une forme rudimentaire de "time-lock" pour des engagements de fonds.

### Spécifications

1. **Développement du Smart Contract (25% des points)**
    - Création d'un contrat intelligent qui permet aux utilisateurs d'envoyer de l'Ether au contrat.
    - Implémentation d'une logique de verrouillage temporel, empêchant le retrait de l'Ether pendant une période déterminée (par exemple, 7 jours).
    - Mise en place d'une fonction de retrait qui devient active seulement après la période de verrouillage.
2. **Test du Smart Contract (50% des points)**
    - Tests pour vérifier que l'Ether est correctement reçu et stocké par le contrat.
    - Vérification de la fonctionnalité de verrouillage temporel pour s'assurer que les fonds ne peuvent être retirés avant la fin de la période spécifiée.
    - Tests pour confirmer que le retrait fonctionne correctement une fois la période de verrouillage terminée.
3. **Développement du Front-end React (25% des points)**
    - Construction d'une interface utilisateur en React (avec Vite ou Next.js) pour faciliter les dépôts et les retraits d'Ether.
    - Affichage d'un compte à rebours ou d'une indication de la période de verrouillage restante pour chaque utilisateur.
    - Intégration de fonctionnalités pour informer les utilisateurs une fois que leurs fonds sont disponibles pour retrait.

### Points Bonus

- **Fonctionnalités de Rappel** : Implémenter un système de notifications ou de rappels pour informer les utilisateurs lorsque leur période de verrouillage est sur le point de se terminer.
- **Options de Période de Verrouillage Variables** : Offrir aux utilisateurs la possibilité de choisir différentes périodes de verrouillage pour leurs dépôts, avec éventuellement des incitations pour des périodes plus longues.# Important
- Avant de démarrer le projet (avec la commande npm run dev), il faut ouvrir Visual Studio Code (ou un Terminal) et ouvrir une instance (de Terminal VS Code ou autre) à la machine WSL préalablement installée. Dans le cadre de mon utilisation professionnelle, pour des raisons de sécurité, je dois également ouvrir mes droits d'Admin, connecter mon poste Windows à l'un de nos VPN puis connecter ma machine sous-système Linux Ubuntu WSL à son VPN (commande sudo service wsl-vpnkit start pour ouvrir son VPN, status à la place de start pour vérifier le status, et stop à la place de start pour mettre fin à la connexion). 
- Pour arrêter le Serveur du projet qui tourne il faut appuyer simultanément sur les touches Control et C.
En cas de problème de type port déjà occupé, il est possible de spécifier un autre port à démarrer pour ce projet (au niveau de la configuration dans le package.json au niveau du script dev).
- Il est à noter que l'on peut aussi mettre fin à un processus (commande taskkill /f /pid number_of_pid_concerned_by_the_current_port_number), processus PID que l'on trouve avec la commande netstat -a --numeric-ports | grep :port_current_number_opened (cette commande Linux est l'équivalente de la commande Windows netstat -ano | find port_current_number_opened)

Useful commands:

| Command           | Description                            |
| ----------------- | -------------------------------------- |
| `npm run dev`     | Start the vite server in dev mode      |
| `npm run compile` | Compile the smart contracts with Forge |
| `npm run test`    | Test the smart contracts with Forge    |

### Spécifications attendues sur ce projet

1. **Développement du Smart Contract (25% des points)**
    - Le smart contract doit permettre la gestion de plusieurs administrateurs.
    - Introduction du rôle de modérateur :
        - Les modérateurs sont autorisés à modifier le "Message of the Day".
        - Les administrateurs conservent la capacité de nommer ou de révoquer des modérateurs.
    - Assurer que seul un administrateur peut ajouter ou retirer des administrateurs et des modérateurs.
    - Mettre en place des contrôles pour s'assurer que seuls les utilisateurs avec les droits appropriés (admin ou modérateur) puissent modifier le message.
2. **Test du Smart Contract (50% des points)**
    - Tests pour valider la gestion multi-administrateurs et les droits de modification du message.
    - Tests pour vérifier que seuls les administrateurs peuvent nommer des modérateurs et des administrateurs.
    - Tests pour confirmer que les modérateurs peuvent modifier le message mais ne peuvent pas gérer les rôles.
3. **Développement du Front-end React (25% des points)**
    - Développer une interface utilisateur permettant d'afficher et de modifier le "Message of the Day".
    - Implémenter des fonctionnalités distinctes pour les administrateurs (gestion des rôles) et les modérateurs (modification du message).
    - Assurer une distinction claire dans l'interface utilisateur entre les droits des administrateurs et des modérateurs.

### Points Bonus

- **Historique des Modifications** : Créer un historique enregistrant qui a modifié le message et quand, offrant ainsi une transparence sur les modifications apportées au message.
- **Sécurité Renforcée** : Mettre en place des mesures supplémentaires pour sécuriser le processus de nomination des modérateurs et administrateurs, comme des vérifications de double authentification ou des confirmations par plusieurs administrateurs.

