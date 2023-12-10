// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;
pragma solidity ^0.8.0;

import "forge-std/console.sol";

contract Bank {

    // mapping(_KeyType => _ValueType) des comptes des utilisateurs
    mapping(address=>uint) public balances;
    // mapping(address => mapping(address => uint256)) public balances;

    // mapping(_KeyType => _ValueType) d'enregistrement des dates des transferts
    mapping(address=>uint) public dates;

    // date à partir de laquelle les utilisateurs pourront retirer l'argent (leurs Tokens)
    uint dateDelayForRetrieve = 7 days;

    uint currentDate = block.timestamp;

    bool public actionTaken = false;

    constructor() {}

    /* constructor() {
        currentDate = block.timestamp - 86400;
    } */

    // receive() pour recevoir l'argent (les Tokens) sur le compte concerné
    receive() external payable {

        // mise à jour de la balance du compte
        balances[msg.sender] += msg.value; 

        // mise à jour de la date à partir de laquelle l'utilisateur pourra retire son argent (ses Tokens)
        dates[msg.sender] = block.timestamp + dateDelayForRetrieve;

    }

    // withdraw() pour retirer l'argent (les Tokens) du compte de l'utilisateur
    // avant : function withdraw() external payable {
    function withdraw() external payable {

        console.log(dates[msg.sender]);
        console.log(currentDate);
        // vérification du retrait possible en fonction de la date
        // require([dates[msg.sender]] >= block.timestamp);
        require(balances[msg.sender] > 0, "No funds to withdraw");
        require(currentDate >= dates[msg.sender], "La date limite pour retirer vos Tokens n'est pas encore atteinte.");
        // ou on peut aussi ainsi : if(dates[msg.sender] < block.timestamp) revert();

        // retrait de l'argent (des Tokens) de l'utilisateur
        payable(msg.sender).transfer(balances[msg.sender]);

        // mise à jour de la balance après le retrait
        // reset de la balance
        balances[msg.sender] = 0;
        
    }
    
}
