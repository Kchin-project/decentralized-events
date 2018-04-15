# Decentralized Events

This is a repository with a Smart Contract Prototype. With it you can sell tickets for your event and receive ETH as payment. Its funcionalities are:

  - setNewPrice (uint \_quantity) : Owner can set new price per ticket. In WEI, please.
  - buyTicket (uint \_quantity) : Everybody can buy one or more tickets.
  - getMyTickets () : It returns your ticket with its status and tickets quantity.
  - readTicket (address \_spectatorAccount): Owner can read the status of all tickets. It returns status and tickets quantity.
  - validateTicket (address \_spectatorAccount) : Owner can mark a ticket as used.
  - withdraw (uint \_amount) : Owner can withdraw ETHER of its earns.
  - changeStatus () : If current status is Active, It will set the event's status as Inactive. If current status is Inactive, It will set event's status as Active.

## New Features soon!

  - Re-use Smart Contract for future events.
  - Divide earnings between more owners.
  - Give tickets free.


## Where is the code?

You can get the [code here](https://github.com/ethereumchile/decentralized-events/blob/master/app/contracts/decentralized-events.sol).

_Note: It was developed with [Embark Framework](https://github.com/embark-framework/embark) for the future generations_

