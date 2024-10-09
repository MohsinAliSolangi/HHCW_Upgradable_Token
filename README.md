# HHCW Upgradable Token

The **HHCW_Upgradable_Token** is a decentralized, upgradeable ERC20 token that supports seamless upgrades through smart contract proxies. This project is designed to ensure that the token’s functionality can evolve without disrupting the existing token holders or contracts interacting with it. Built on the Ethereum blockchain, the upgradeable token allows for secure and flexible contract updates, making it a scalable solution for decentralized applications (DApps).

---

## 📝 Project Overview

The **HHCW_Upgradable_Token** project includes only the smart contracts necessary for creating and managing the upgradeable ERC20 token.

- **Smart Contract**: Implements the ERC20 token standard and the upgradeable proxy pattern.

### Key Features:
- **Upgradeable Contracts**: The token's logic can be upgraded without affecting the existing state.
- **ERC20 Compliant**: Follows the ERC20 token standard for compatibility with decentralized exchanges and wallets.
- **Decentralized Management**: Upgradeability is managed in a decentralized manner, allowing future updates based on governance decisions.

---

## 📂 Project Structure

### 1. **Smart Contracts**
   - `contracts/` folder contains all the smart contracts.
   - **ERC20 Token Contract**: The core token contract implementing the ERC20 standard.
   - **Upgradeable Proxy Contract**: Implements a proxy pattern allowing for seamless contract upgrades.
   - **Governance Contract (if any)**: Optional contract for managing upgrade proposals.

---

## 🚀 Deployment Instructions

### Prerequisites
- **Node.js** and **npm** installed.
- **Hardhat**: For smart contract deployment.
- **Metamask** or any Ethereum wallet for interacting with the deployed contracts.

### 1. **Smart Contract Deployment**
```bash
cd smart-contract
npm install
npx hardhat compile
npx hardhat deploy --network <network-name>
```
- Replace `<network-name>` with the target Ethereum network (e.g., Goerli, Sepolia).

---

## 🛠️ Technologies Used

- **Solidity**: Smart contracts written in Solidity for ERC20 and upgradeability features.
- **Hardhat**: For compiling, testing, and deploying the smart contracts.
- **OpenZeppelin**: Reusable contracts for upgradeable tokens and proxy patterns.

---

## 🏗️ Upgrading the Token

1. **Deploy New Logic Contract**: 
   - Deploy a new contract with the updated logic.
   - Example:
   ```bash
   npx hardhat deploy --network <network-name> --tags <new-logic-contract>
   ```

2. **Execute Upgrade**:
   - Use the governance or admin functions to point the proxy to the new logic contract.

---

## 🔗 Smart Contract Addresses

- **Proxy Contract**: `0x123...abc`
- **Logic Contract v1**: `0x456...def`
- **Logic Contract v2**: `0x789...ghi`

---

## 📄 License

This project is licensed under the MIT License.

---

## 📧 Contact

For any questions or inquiries, feel free to reach out to:

- **LinkedIn**: [Mohsin Ali Solangi](https://www.linkedin.com/in/mohsinalisolangi/)
- **GitHub**: [mohsinalisolangi](https://github.com/mohsinalisolangi)

Thank you for exploring the **HHCW Upgradable Token** project! 😄
```
