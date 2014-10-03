//
//  LifeForm.swift
//  TextGame
//
//  Created by Charles Jones on 9/24/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

class LifeForm
{
    var name: String
    var health: Int
    var attack: Int
    var magic: Int
    init()
    {
        self.name = "Creature"
        self.health = 25
        self.attack = 5
        self.magic = 5
    }
    init(inout _name: String!){
        self.name = _name
        self.health = 25
        self.attack = 5
        self.magic = 5
    }
    
    var cName: String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    var cHealth: Int{
        get{
            return health
        }
        set{
            health = newValue
        }
    }
    
    var cAttack: Int{
        get{
            return attack
        }
        set{
            attack = newValue
        }
    }
    
    var cMagic: Int{
        get{
            return magic
        }
        set{
            magic = newValue
        }
    }
    //Send attackMonster to monster class
    func attackMonster(inout m: Monster!){
        if m != nil
        {
            m.health -= attack
        }
    }
    //Send attackHuman to human class
    func attackHuman(inout h: Human!){
        if h != nil
        {
            h.health -= attack
        }
    }
}
