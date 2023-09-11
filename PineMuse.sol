// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract PineMuse is ERC20 {
    address public admin;
    constructor() ERC20("Pine Muse", "PIM") {
        admin=msg.sender;
        _mint(msg.sender, 10000000000 * 10**decimals());
    }
    function updateAdmin(address newAdmin) external {
        require(msg.sender == admin, "Access Denied");
        admin = newAdmin;
    }
    function mint(address to, uint amount) external {
        require(msg.sender == admin, "Access Denied");
        _mint(to, amount);
    }
    function burn(address owner, uint amount) external {
        require(msg.sender == admin, "Access Denied");
        _burn(owner, amount);
    }
}