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
    override init()
    {
        super.init()
    }
    override init(_name: String, _health: Int, _attack: Int, _magic: Int)
    {
        super.init(_name: name, _health: health, _attack: attack, _magic: magic)
    }
}
