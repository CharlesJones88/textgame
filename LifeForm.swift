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
        self.magic = 3
    }
    init(_name: String, _health: Int, _attack: Int, _magic: Int)
    {
        self.name = _name
        self.health = _health
        self.attack = _attack
        self.magic = _magic
    }
    
    var getName: String
        {
        get{
            return name
        }
        set{
            name = newValue
        }
    }
    
    var totalHealth: Int
        {
        get{
            return health
        }
        set{
            health = newValue
        }
    }
    
    var totalAttack: Int
        {
        get{
            return attack
        }
        set{
            attack = newValue
        }
    }
    
    var totalMagic: Int
        {
        get{
            return magic
        }
        set{
            magic = newValue
        }
    }
    //Send attackMonster to monster class
    func attackMonster(inout m: Monster!)
    {
        if m != nil
        {
            m.health -= attack
        }
    }
    //Send attackHuman to human class
    func attackHuman(inout h: Human!)
    {
        if h != nil
        {
            h.health -= attack
        }
    }
}
