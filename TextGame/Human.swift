//
//  Human.swift
//  TextGame
//
//  Created by Charles Jones on 9/24/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

class Human : LifeForm
{
    override init()
    {
        super.init()
    }
    
    override init(inout name: String!)
    {
        super.init(name: &name)
    }

}