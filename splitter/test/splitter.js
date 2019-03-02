const Splitter = artifacts.require("Splitter");

contract('Splitter', (accounts) => {
	let splitter,owner, alice, bob, carol;
	alice=accounts[0];
	bob = accounts[1];
	carol = accounts[2];

  it('should divide the money beetween bob and carol equally', async () => {
  	const splitterInstance = await Splitter.deployed();
  	await splitterInstance.split(bob,carol, {from:alice, value:511});
  	
  	const bobBal = await splitterInstance.balances.call(bob);
  	const carolBal = await splitterInstance.balances.call(carol);
  	assert.equal(bobBal.valueOf(),255,"Bob Balance : Lower half of the amount should be given to Bob");
  	assert.equal(carolBal.valueOf(),256,"Carol Balance: Higher half of the amounts should be given to Carol");

  });

});