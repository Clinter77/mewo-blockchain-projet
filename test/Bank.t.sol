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
  uint256 currentDate = block.timestamp;

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

  function testWithdraw(uint currentDateWithDelayApplied) public {
    // vm.prank(user); // prochaine ligne exécutée en tant qu'user
    // currentDate = block.timestamp - 86400;

    // vm.warp(delay);
    // emit log_uint(delay);
    // vm.expectRevert("Action should be taken after 7 days");

    // bank.withdraw();
    // assertTrue(bank.actionTaken(), "Action should be taken after 7 days");
    currentDateWithDelayApplied = block.timestamp - 86400;
    vm.warp(currentDateWithDelayApplied);
    bank.withdraw(currentDateWithDelayApplied);
    assertTrue(bank.actionTaken(), "Action should be taken after time delay");
  }
}
