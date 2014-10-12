//
//  Monster.swift
//  TextGame
//
//  Created by Charles Jones on 9/24/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

class Monster : LifeForm
{
    var healthValue: Int
    var attackValue: Int
    override init()
    {
        healthValue = 0
        attackValue = 0
        super.init()
    }
    
    init(inout name: String!, inout healthValue: Int!, inout attackValue: Int!)
    {
        self.healthValue = healthValue
        self.attackValue = attackValue
        super.init(name: &name)
    }
    
    var mHealth: Int
    {
        get
        {
            return self.healthValue
        }
        set
        {
            self.healthValue = newValue
        }
    }
    
    var mAttack: Int
    {
        get
        {
            return self.attackValue
        }
        set
        {
            self.attackValue = newValue
        }
    }
 
    
    func firstEncounter() -> Bool
    {
        return encounter
    }
    
    func disableFirstEncounter()
    {
        encounter = false
    }
    
    func enableFirstEncounter()
    {
        encounter = true
    }
    
    override func attackHuman(inout h: Human!)
    {
        if h != nil
        {
            h.cHealth -= self.mAttack
        }
    }
    
}
