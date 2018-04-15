pragma solidity ^0.4.17;

/*
Autor: Javier Guajardo
Twitter: @EthereumChile
Website: https://ethereumchile.cl
*/

contract DecentralizedEvents {


    address public owner;
    string public eventName = "EthereumChile 3th MeetUp";
    uint public supplyTickets = 100;
    bool public isActive = true;
    uint public pricePerTicket = 10000000000000000; // JS -> web3.toWei('0.01', 'ether'); -> 0.01 ETH in WEI

    struct Ticket {

        uint quantity;
        bool status;

    }

    mapping(address => Ticket) private tickets;

    function DecentralizedEvents () public {

        owner = msg.sender;

    }

    modifier onlyOwner {

        require(msg.sender == owner);
        _;

    }

    modifier onlyActive {

        require(isActive);
        _;

    }

    function setNewPrice (uint _price) public onlyOwner onlyActive { // owner can change price per ticket

        pricePerTicket = _price;

    }

    function buyTicket (uint _quantity) public payable onlyActive { // buy ticket if event is active

        if (_quantity == 0)

            _quantity = 1;

        require(supplyTickets >= _quantity && msg.value == (pricePerTicket * _quantity));

        if (tickets[msg.sender].status) {

            tickets[msg.sender].quantity = tickets[msg.sender].quantity + _quantity;

        } else {

            tickets[msg.sender].status = true;
            tickets[msg.sender].quantity = _quantity;

        }

        supplyTickets = supplyTickets - _quantity;

    }

    function getMyTickets () public constant returns (uint) { // everybody can see its tickets

        return tickets[msg.sender].quantity;

    }

    function readTicket (address _spectatorAccount) public constant onlyOwner returns (uint, bool) { 
        // only owner can  read the ticket. it returns quantity and status; 
        //if quantity > 0 and status == false, ticket was used
        return (tickets[_spectatorAccount].quantity, tickets[_spectatorAccount].status);
    }

    function validateTicket (address _spectatorAccount) public onlyOwner { // mark ticket as used

        require(tickets[_spectatorAccount].status);
        tickets[_spectatorAccount].quantity = 0;

    }

    function withdraw (uint _amount) public onlyOwner { // withdraw ether

        owner.transfer(_amount);

    }

    function changeStatus() public onlyOwner { // set active or inactive the event

        isActive = !isActive;

    }

}