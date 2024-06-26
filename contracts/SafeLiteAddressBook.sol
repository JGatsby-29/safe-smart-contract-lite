// SPDX-License-Identifier: MIT

//  Off-chain signature gathering multisig that streams funds - @austingriffith
//
// started from 🏗 scaffold-eth - meta-multi-sig-wallet example https://github.com/austintgriffith/scaffold-eth/tree/meta-multi-sig
//    (off-chain signature based multi-sig)
//  added a very simple streaming mechanism where `onlySelf` can open a withdraw-based stream
//

pragma solidity >=0.8.0 <0.9.0;
// Not needed to be explicitly imported in Solidity 0.8.x
// pragma experimental ABIEncoderV2;

contract SafeLiteAddressBook {
    event WalletRecord(address indexed creator, address indexed wallet);
    event Deposit(address indexed sender, uint amount, uint balance);

    mapping(address => address[]) public walletsByOwner;

    function recordWallet(address _owner, address _wallet) external {
        walletsByOwner[_owner].push(_wallet);
        emit WalletRecord(_owner, _wallet);
    }

    function getWalletsByOwner(address _owner) external view returns (address[] memory) {
        return walletsByOwner[_owner];
    }
}