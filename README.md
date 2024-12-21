# Proxy Smart Contract with Upgradeable Logic

![Solidity](https://img.shields.io/badge/Solidity-%5E0.7.0%20%7C%20%5E0.8.0-blue) ![License](https://img.shields.io/badge/License-GPL--3.0-green) ![Status](https://img.shields.io/badge/Status-Development-yellow)

## Overview 🚀
This project demonstrates a **proxy smart contract** pattern that supports upgradeable logic. By using low-level `delegatecall` and storage slots, the contract enables seamless upgrades to newer versions without losing state.

The project consists of three main contracts:
- **ProxyContract** – Handles the delegation and upgrade mechanism.
- **v1** – Initial logic contract to manage a simple `age` variable.
- **v2** – Upgraded logic contract with two variables (`age1` and `age2`) and functions to manage them.

---

## Features ✨
- **Upgradeable Logic**: Change logic contracts without redeploying the proxy.
- **Admin Control**: Only the admin (deployer) can perform upgrades.
- **Fallback & Delegation**: Forward calls to the current logic contract.
- **Efficient Storage**: State variables persist through upgrades.

---

## How It Works ⚙️
- **ProxyContract** manages two storage slots:
  - `_OWNER_SLOT`: Stores the admin address.
  - `_SCWBL_SLOT`: Stores the address of the current logic contract.
- **Admin** deploys the proxy and sets the initial logic contract.
- **Users** interact with the proxy, which forwards their calls to the current logic contract.
- **Upgrades** are performed by calling `upgrade()` and passing the new logic contract address.

---

## Setup 🛠️

### Prerequisites 📋
- Install [Node.js](https://nodejs.org/).
- Install [Hardhat](https://hardhat.org/) or [Truffle](https://trufflesuite.com/) for testing and deployment.
- Ethereum wallet (e.g., [MetaMask](https://metamask.io/)).

### Deployment 🚀
1. Deploy the **ProxyContract**.
2. Deploy **v1** logic contract.
3. Call the `upgrade` function of the proxy to set the logic contract.

---

## Functions 📚

### ProxyContract
| Function                       | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `admin()`                      | Returns the admin address stored in `_OWNER_SLOT`.                          |
| `samart_contract_with_logic()` | Returns the current logic contract address.                                 |
| `upgrade(address)`             | Upgrades to a new logic contract. Admin only.                               |
| `fallback()`                   | Forwards calls to the current logic contract using `delegatecall`.           |

### v1 Logic Contract
| Function                       | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `setAge(uint)`                 | Sets the `age` variable.                                                    |

### v2 Logic Contract
| Function                       | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `setAge1(uint)`                | Sets the `age1` variable.                                                   |
| `setAge2(uint)`                | Sets the `age2` variable.                                                   |

---

## Example Workflow 📈
1. Deploy the **ProxyContract**.
2. Deploy **v1** and upgrade the proxy to use it.
3. Interact with `setAge` via the proxy.
4. Deploy **v2** and upgrade the proxy to use the new logic.
5. Interact with `setAge1` and `setAge2` via the proxy.

---

## Security 🔐
- **Ownership Control**: Only the admin can upgrade the contract.
- **Revert on Failure**: If `delegatecall` fails, the transaction is reverted.
- **Storage Slot Hashing**: Storage slots are hashed to prevent collisions.

---

## License 📜
This project is licensed under the **GPL-3.0** License. See the LICENSE file for more details.

---

## Contact 📧
For questions or issues, reach out to:
- **Email**: your-email@example.com

![Ethereum](https://img.shields.io/badge/Ethereum-Proxy-black) ![Upgradeable](https://img.shields.io/badge/Upgradeable-Smart%20Contract-purple) ![Open Source](https://img.shields.io/badge/Open%20Source-Contribution-orange)

