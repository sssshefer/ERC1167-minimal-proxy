import { loadFixture, ethers, expect } from "./setup";
import { Implementation, ProxyFactory, Implementation__factory } from "../typechain-types";


describe("ERC1167", function () {
  async function deploy() {
    const [user] = await ethers.getSigners();

    const ImplContractFactory = await ethers.getContractFactory("Implementation");
    const impl: Implementation = await ImplContractFactory.deploy();
    await impl.waitForDeployment();

    const ProxyFactoryContractFactory = await ethers.getContractFactory("ProxyFactory");
    const maker: ProxyFactory = await ProxyFactoryContractFactory.deploy();
    await maker.waitForDeployment();

    return { impl, maker, user }
  }

  it("Should delegate", async function () {
    const { impl, maker, user } = await loadFixture(deploy);

    const implAddress = await impl.getAddress();

    const tx = await maker.make(implAddress);
    await tx.wait();

    const lastDeployedProxyAddr = await maker.lastDeployedProxy();

    const proxy = Implementation__factory.connect(lastDeployedProxyAddr, user);
    expect(await proxy.a()).to.eq(0);

    const txSetA = await proxy.callMe(2323);
    await txSetA.wait();
    expect(await proxy.a()).to.eq(2323);
  })
});