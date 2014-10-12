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
    var encounter: Bool = false
    init()
    {
        self.name = ""
        self.health = 0
        self.attack = 0
        self.magic = 0
        self.encounter = true
    }
    
    init(inout name: String!)
    {
        self.name = name
        self.health = 25
        self.attack = 5
        self.magic = 5
        self.encounter = true
    }
    
    var cName: String
    {
        get
        {
            return self.name
        }
        set
        {
            self.name = newValue
        }
    }
    
    var cHealth: Int
    {
        get
        {
            return self.health
        }
        set
        {
            self.health = newValue
        }
    }
    
    var cAttack: Int
    {
        get
        {
            return self.attack
        }
        set
        {
            self.attack = newValue
        }
    }
    
    var cMagic: Int
    {
        get
        {
            return self.magic
        }
        set
        {
            self.magic = newValue
        }
    }
    //Send attackMonster to monster class
    func attackMonster(inout m: Monster!)
    {
        if m != nil
        {
            m.mHealth -= cAttack
        }
    }
    //Send attackHuman to human class
    func attackHuman(inout h: Human!)
    {
        
    }
}
