# 🔃 Reentrancy Attack Demo

This repository demonstrates a reentrancy attack on a vulnerable smart contract. The project consists of two contracts:

- **Bank.sol**: A vulnerable contract that allows deposits and withdrawals but is susceptible to reentrancy.
- **Caller.sol**: An attacking contract that exploits the vulnerability to drain funds.

---

## 📜 Contract Overview

### 1. Bank.sol (Vulnerable Contract)
- Allows users to deposit and withdraw Ether.
- **Bug:** Updates balances *after* transferring funds, making it vulnerable to reentrancy.

### 2. Caller.sol (Attacker Contract)
- Deposits Ether into `Bank.sol`.
- Calls `withdraw()`, exploiting the reentrancy bug.
- Uses the `receive()` function to recursively drain funds before the balance updates.
