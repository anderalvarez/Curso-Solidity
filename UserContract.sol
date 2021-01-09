pragma solidity ^0.4.24;

// Contrato tipo agenda
contract UserContract {

    // Datos del usuario
    struct User {
        string name;
        string surName;
    }

    // Mapping es como un diccionario <Key, Value>
    mapping(address => User) private users;

    function join(string name, string surName) public {
        User storage user = users[msg.sender]; 
        user.name = name;
        user.surName = surName;
        /*
        NOTA: La palabra storage sirve para que lo que introduzcamos se persista
        Si se usa la palabra memory haria que podamos operar pero no persistir
        Parece que storage es almacenar y memory para algo temporal
        */ 
    }

    function getUser(address addr) public view returns(string, string){
        User memory user = users[addr];
        return (user.name, user.surName);
    }



}