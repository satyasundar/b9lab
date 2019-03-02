pragma solidity >=0.5.0 <=0.6.0;


contract Splitter {
	address public owner;
	mapping(address => uint) public balances;

	event LogSplit(address indexed sender, address indexed receiver1, address indexed receiver2, uint amount);

	constructor() public {
		owner = msg.sender;
	}

	function split(address bobAddr, address carolAddr) payable public returns (address){
		
		require(bobAddr != address(0x0));
		require(carolAddr != address(0x0));
		require(msg.value > 0);
		
		address aliceAddr = msg.sender;
		uint aliceBal = msg.value;

		uint half = aliceBal/2;
		balances[bobAddr] += half;
		balances[carolAddr] += aliceBal - half;
		emit LogSplit(aliceAddr,bobAddr,carolAddr,aliceBal);
	}

}