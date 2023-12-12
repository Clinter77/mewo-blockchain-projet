// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/Bank.sol";
// import "truffle/Assert.sol";
// import "../node_modules/truffle/build/Assert.sol";

contract BankTest is Test {

  address user = address(0x1);
  Bank bank;
  // uint date = block.timeStamp;
  uint256 delay = 1 days;
  // uint256 daysInSecond = 86400 seconds;
  uint256 timestamp  = block.timestamp;
  uint256 daysInSecond = 6 days; // 6 jours en secondes
  uint numberOfDays = timestamp / daysInSecond;
  uint dateDelayForRetrieve = 7 days;

  uint256 currentDate = block.timestamp;
  // uint256 currentDateWithDelayApplied = currentDate + 86400;

  mapping(address=>uint) public dates;
  

  event LogValueCurrentDate(uint256 indexed value);

  error TooEarly(uint time);
  
  
  modifier onlyAfter(uint time) {
    if (block.timestamp <= time) revert TooEarly(time);
    _;
  }

  function setUp() public {
    bank = new Bank(block.timestamp);
  }


  function testReceive() public {
    uint256 testAmount = 3 ether;
    vm.deal(user, testAmount); // donner 3 Ether à l'user
    vm.prank(user); // prochaine ligne exécutée en tant qu'user
    

    // appel de payable pour tester l'ajout de Token
    payable(address(bank)).call{value: testAmount}(""); // surligné en jaune pour indiquer qu'en fait dans le cas présent, un modifier pourrait être utilisé à la place
    assertEq(bank.balances(user), testAmount);
  }

  // function beforeEach(){
  //   dates[msg.sender] = block.timestamp;
  // }

  // function beforeEachAgain(){
  //   dates[msg.sender] = block.timestamp - 86400;
  // }  
     
  function testWithdrawWithBadDelay(uint currentDateWithDelayApplied) public {
    // vm.prank(user); // prochaine ligne exécutée en tant qu'user
    // currentDate = block.timestamp - 86400;

    /* définition d'une date inférieure à la date possible de retrait pour tester que le retrait
    ne soit pas possible (car la date est inférieure à 7 jours) */
    currentDateWithDelayApplied = currentDate + dateDelayForRetrieve - 1 days;
    // vm.warp(delay);
    // emit log_uint(delay);
    // vm.expectRevert("Action should be taken after 7 days");

    // bank.withdraw();
    // assertTrue(bank.actionTaken(), "Action should be taken after 7 days");
    console.log("currentDate ",currentDate); //  renvoie 1
    console.log("daysInSecond ",daysInSecond); //  renvoie 518400 soit 6 jours
    console.log("timestamp ",timestamp); //  renvoie 1
    console.log("currentDate + dateDelayForRetrieve ",currentDate + dateDelayForRetrieve - 1 days); //  renvoie 0
    console.log("dates[msg.sender] ",dates[msg.sender]); // renvoie 

    currentDateWithDelayApplied = block.timestamp - 86400 seconds;
    console.log("65 - currentDateWithDelayApplied ",currentDateWithDelayApplied);
    // Émettre l'événement pour observer la valeur
    emit LogValueCurrentDate(currentDateWithDelayApplied);
    console.log("68 - currentDateWithDelayApplied ",currentDateWithDelayApplied);
    
    // vm.warp(block.timestamp - daysInSecond);
    // bank.withdraw(currentDate - daysInSecond);
    assertTrue(bank.actionTaken(), "Action should be taken after time delay");

    vm.warp(currentDateWithDelayApplied);
    bank.withdraw(currentDateWithDelayApplied);
    // currentDateWithDelayApplied = subtractDays(86400 seconds);
    // assertTrue(bank.actionTaken(), "Action should be taken after time delay");
    // assertEq(currentDateWithDelayApplied == );
    // bank.withdraw(currentDateWithDelayApplied);
  }

  function subtractDays(uint256 secondsToSubtract) public view returns (uint256) {
    // Calcul du timestamp actuel moins le nombre de jours converti en secondes
    require(secondsToSubtract <= 86400 seconds, "Substraction would result in underflow");
    uint256 newTimestamp = block.timestamp - (secondsToSubtract * daysInSecond);
    return newTimestamp;
  }

}
