// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
 
 import "./Ownable.sol";
 
contract MessageStorage is Ownable{
   

    string private message;
    
    function setMessage(string memory newMessage) public payable {
        require(msg.value == 3 ether);
        message = newMessage;
    }
    
    function getMessage() public view returns(string memory) {
        return message;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function getBalanceInEther() public view returns(uint){
        return getBalance() / 1e18;
    }
    
    function transfer(uint amount) public isOwner {
        require(address(this).balance >= amount);
        owner.transfer(amount);
    }
    
    function transferTo(uint amount, address payable to) public isOwner {
        require(address(this).balance >= amount);
        require(to != address(0));
        to.transfer(amount);
    }
    
}
