pragma solidity ^0.4.17;

contract Inbox {
    string public message;

    function Inbox(string initialMessage) public {
        message = initialMessage;
        // initial function, sets initialMessage
        // wtf am I doing?
    }

    function setMessage(string newMessage) public {
        message = newMessage;
        // sets new message, overwriting Inbox
    }

}
