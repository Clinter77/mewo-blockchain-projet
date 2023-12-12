# Message of the day v2 - React + TypeScript + Vite + Solidity

Ce projet est une évolution du projet initial 'Message of the Day'. Dans cette version, il est demandé d'étendre les fonctionnalités du smart contract pour gérer plusieurs administrateurs et introduire un nouveau rôle : le modérateur. Cette itération permettra de gérer des niveaux d'accès différenciés et d'explorer des concepts avancés de gouvernance dans un smart contract.

# Important
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
