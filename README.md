<img src="https://github.com/user-attachments/assets/fa1bb4d7-0381-48f0-82cc-d8fbcd950270" alt="proxy-image"/>

# ERC1167-minimal-proxy

The **ERC1167-minimal-proxy** project showcases the implementation and usage of minimal proxy contracts (often referred to as "clones") based on the ERC1167 standard. This project provides a comprehensive guide to deploying and interacting with minimal proxy contracts, highlighting their efficiency and utility in various use cases. The project includes a simple example of deploying a proxy contract and executing functions through the proxy, demonstrating the practical benefits of this pattern.

## Table of Contents
- [Introduction](#erc1167-minimal-proxy)
- [Theory Notes](#theory-notes)
  - [What is Minimal Proxy](#what-is-minimal-proxy)
  - [What is an Opcode](#what-is-an-opcode)
  - [How Does It Work](#how-does-it-work)
- [Features and Functionality](#features-and-functionality)
- [Implementation](#implementation)
  - [Contract Overview](#contract-overview)
  - [Tests](#tests)
- [Running the Project Locally](#running-the-project-locally)

## Theory Notes

### What is Minimal Proxy
A minimal proxy contract is a lightweight contract that delegates all calls to a predefined implementation contract using the `DELEGATECALL` opcode. This pattern is popular in the Ethereum ecosystem for creating multiple instances of a contract that share the same logic, reducing gas costs by avoiding full contract deployment for each instance.

### What is an Opcode
An opcode (short for "operation code") is a single instruction that specifies an operation for the Ethereum Virtual Machine (EVM) to execute. Opcodes are the low-level commands that drive the behavior of smart contracts on the Ethereum network. Each opcode represents a basic operation, such as arithmetic, data storage, or control flow, and is represented by a unique hexadecimal code. For example, `0xF3` corresponds to the `RETURN` opcode, which stops execution and returns output data. 

### How Does It Work
The minimal proxy contract works by delegating all calls to an implementation contract. The core of this pattern is a small piece of bytecode (known as the "creation code") that, when deployed, creates a contract forwarding all calls to the target implementation. The creation bytecode for a minimal proxy is constructed using a combination of opcodes and the address of the implementation contract. 

The creation code typically looks like this:
`3d60ad80600a3d3981f3363d3d373d3d3d363d73<implementation_address>5af43d82803e903d91602b57fd5bf3`
This bytecode is responsible for creating a proxy contract that delegates calls to the specified implementation.

## Features and Functionality
- **Gas Efficiency:** Deploying minimal proxies is significantly cheaper than deploying full contracts.
- **Delegation:** Proxies delegate calls to a predefined implementation contract, enabling code reuse.
- **Factory Deployment:** Easily create new proxy instances with a factory contract.

## Implementation

### Contract Overview
This project consists of three main contracts:

1. **ERC6551BytecodeLib:** A library that provides the creation code for deploying minimal proxies.
2. **ProxyFactory:** A factory contract responsible for creating new minimal proxy instances.
3. **Implementation:** A simple contract containing a state variable and a function to demonstrate the functionality of the proxy.

### Tests
The project includes tests written in TypeScript to ensure that the minimal proxy pattern is implemented correctly. These tests deploy an implementation contract, use the `ProxyFactory` to create a proxy, and then interact with the proxy to verify that it correctly delegates calls to the implementation.

## Running the Project Locally
To run this project locally:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/sssshefer/ERC1167-minimal-proxy.git
    cd erc1167-minimal-proxy
    ```

2. **Install dependencies:**
    ```bash
    npm install
    ```

3. **Compile contracts:**
    ```bash
    npx hardhat compile
    ```

4. **Run tests:**
    ```bash
    npx hardhat test
    ```

This setup allows you to explore the project and understand how minimal proxies work in practice.

<hr/>

<a href="https://ru.freepik.com/free-vector/people-carrying-arrows-opposite-directions_3585178.htm#fromView=search&page=1&position=5&uuid=e89e33a2-08b8-495c-a4b0-84963195d57b">Picture is from rawpixel.com on Freepik</a>

***Happy Hacking***
