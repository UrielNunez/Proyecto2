//
//  ClaseUser.swift
//  Proyecto2
//
//  Created by Usuario on 19/05/22.
//

import Foundation
import UIKit

var arrayUsuario : [User] = [usuario1, usuario2]
var usuario1 = User(name: "Alan", scoreHangman: 0, scoreTrivia: 0, scoreTicTacToe: 0, user: "alan", password: "admin" )
var usuario2 = User(name: "Uriel", scoreHangman: 0, scoreTrivia: 0, scoreTicTacToe: 0, user: "uri", password: "admin123" )

class User{
    var name: String;
    var scoreHangman: Int;
    var scoreTrivia: Int;
    var scoreTicTacToe: Int
    var user: String;
    var password: String;

    
    init(name: String, scoreHangman: Int, scoreTrivia: Int, scoreTicTacToe: Int,  user: String, password: String){
        self.name = name;
        self.scoreHangman = scoreHangman;
        self.scoreTrivia = scoreTrivia;
        self.scoreTicTacToe = scoreTicTacToe;
        self.user = user;
        self.password = password;
    }
}
