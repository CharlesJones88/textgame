//
//  TextGameModel.swift
//  TextGame
//
//  Created by Charles Jones on 9/20/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

var state : String = ""
var direction: String = ""
var response: String = ""
var running = false
var isBattle = false
var monster: Monster! = nil
var player: Human! = Human(_name: "Siv",_health: 50,_attack: 10, _magic: 5)


func checkState() -> Bool {
    while running == true
    {
        switch state {
            case "battle":
                //battleLoop()
                break
            case "move":
                break
            default:
                running = false
                break
        }
    }
    return running
}

func checkRand() -> Bool{
    var random : Int = (Int)(arc4random_uniform(10))
    var compareNum = [3, 5, 9]
    var checkNum: Int
    var isBattle: Bool = true
    for var i = 0; i < compareNum.count; i++
    {
        
        checkNum = compareNum[i]
        if random == checkNum{
            state = "battle"
            isBattle = true
        }
        else{
            state = "move"
            isBattle = false
        }
        
    }
    return isBattle
}

func moveDirection(inout checkDir: String!) -> String {
    var dir: String
    switch checkDir{
        case "north":
            dir = "You moved \(checkDir)."
            if isBattle
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "south":
            dir = "You moved \(checkDir)."
            if isBattle
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "east":
            dir = "You moved \(checkDir)."
            if isBattle
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "west":
            dir = "You moved \(checkDir)."
            if isBattle
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        default:
            return "You haven't moved yet."
    }
    
}

func battleLoop(inout response: String!) -> String
{
    var wrapper: String
    if isBattle
    {
       wrapper = "You encountered a " + monster.getName + "!"
    }
    else
    {
        wrapper = "This place is different."
    }
    while isBattle
    {
        if player.totalHealth > 0 && monster.totalHealth > 0 {
            wrapper = "Would you like to attack or attempt to run?"
        
        //response = userInput.text
            switch response {
                case "attack":
                    player.attackMonster(&monster)
                    break
                case "run":
                    if checkRand() == false
                    {
                        isBattle = false
                    }
                    break
                default:
                    wrapper = "I don't understand!"
                    break
            }
        }
        else{
            isBattle = false
            if monster.totalHealth <= 0 {
                wrapper = "You defeated the " + monster.getName + "!"
                    monster = nil
            }
            else if player.totalHealth <= 0 {
                wrapper = "You were defeated!"
                running = false
                
            }
        }
    }
    return wrapper
}