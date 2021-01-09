pragma solidity ^0.4.24;

/*
    NOTA: La palabra storage sirve para que lo que introduzcamos se persista
    Si se usa la palabra memory haria que podamos operar pero no persistir
    Parece que storage es almacenar y memory para algo temporal
*/ 


// Contrato tipo agenda
contract UserContract {

    // Datos del usuario
    struct User {
        string name;
        string surName;
    }

    // Mapping es como un diccionario <Key, Value>
    mapping(address => User) private users;
    mapping (address => bool) private joinedUsers;
    address[] total;

    event onUserJoined(address, string);

    // Funcion de añadir
    function join(string name, string surName) public {
        require(!userJoined(msg.sender)); // Requiere que no este registrado
        User storage user = users[msg.sender]; 
        user.name = name;
        user.surName = surName;  
        joinedUsers[msg.sender] = true;
        total.push(msg.sender); // Se le da de alta en total

        onUserJoined(msg.sender, string(abi.encodePacked(name, " ", surName)));
    }

    // Funcion de obtener Usuario
    function getUser(address addr) public view returns(string, string){
        require(userJoined(addr)); // Requiere que este registrado
        User memory user = users[addr];
        return (user.name, user.surName);
    }

    // Funcion de obtener datos del usuario con esa direccion
    function userJoined(address addr) private view returns (bool){
        return joinedUsers[addr];
    }

    // Funcion de obtener numero total de usuarios
    function totalUsers() public view returns(uint){
        return total.length;
    }
}