pragma solidity >= 0.5.0 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Splitter.sol";

contract TestSplitter {

	address bob = 0x0123456789012345678901234567890123456789;     
	address carol = 0x1234567890123456789012345678901234567890;
	
	uint public initialBalance = 101 finney;
	function testSplit() public {
		
		Splitter splitter = Splitter(DeployedAddresses.Splitter());

		splitter.split.value(101)(bob,carol);
		uint bobBal = splitter.balances(bob);
		uint carolBal = splitter.balances(carol);

		 Assert.equal(address(splitter).balance, 101, "Splitter contract should have 100 wei ");
		 Assert.equal(bobBal, 50, "Bob shuould have 50 wei");
		 Assert.equal(carolBal, 51 , "Carol should have 50 wei");
	}
}

