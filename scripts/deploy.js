const main = async () => {
    const [deployer, randomPerson] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();
  
    console.log('Deploying contracts with account: ', deployer.address);
    console.log('Account balance: ', accountBalance.toString());
  
    const Token = await hre.ethers.getContractFactory('WavePortal');
    const portal = await Token.deploy();
    await portal.deployed();
  
    console.log('WavePortal address: ', portal.address);

    let waveCount;
    waveCount = await portal.getTotalWaves();

    let waveTxn = await portal.wave()
    await waveTxn.wait();

    waveCount = await portal.getTotalWaves();

    waveTxn = await portal.connect(randomPerson).wave();
    await waveTxn.wait();

    waveCount = await portal.getTotalWaves();

    waveTxn = await portal.connect(randomPerson).wave();
    await waveTxn.wait();

    waveCount = await portal.getTotalWaves();

    let maxWaver = await portal.getMaxWaverAddress();

  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.error(error);
      process.exit(1);
    }
  };
  
  runMain();