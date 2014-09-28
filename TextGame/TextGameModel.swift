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
var running: Bool = false
var isBattle: Bool!
//var monster: Monster! = nil
var player: Human! = nil
let welcome: String! = "Hello \(player.cName), would you like to go North, South, East, or West?"

func checkState(inout checkResponse: String!) -> String {
    while running == true
    {
        checkRand()
        switch state
        {
            case "battle":
                return battleLoop(&checkResponse)
            case "move":
                return moveDirection(&checkResponse)
            default:
                running = false
                break
        }
    }
    return "exit"
}

func checkRand() -> Bool{
    var random : Int = (Int)(arc4random_uniform(10))
    var compareNum = [3, 5, 9]
    var checkNum: Int
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
            if isBattle == true
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "south":
            dir = "You moved \(checkDir)."
            if isBattle == true
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "east":
            dir = "You moved \(checkDir)."
            if isBattle == true
            {
                return dir + "A battle has started!"
            }
            else{
                return dir
            }
        case "west":
            dir = "You moved \(checkDir)."
            if isBattle == true
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
    var goblin: String! = "goblin"
    var monster: Monster! = Monster(_name: &goblin)
    if isBattle == true
    {
        wrapper = "You encountered a " + monster.cName + "!"
    }
    else
    {
        wrapper = "This place is different."
    }
    while isBattle == true
    {
        
        if player.cHealth > 0 && monster.cHealth > 0 {
            wrapper = "Would you like to attack or attempt to run?"
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
            if monster.cHealth <= 0 {
                wrapper = "You defeated the " + monster.cName + "!"
                monster = nil
            }
            else if player.cHealth <= 0 {
                wrapper = "You were defeated!"
                running = false
                
            }
        }
    }
    return wrapper
}

func createHuman(inout name: String!) -> String{
    var newPlayer: Human! = Human(_name: &name)
    player = newPlayer
    return welcome
}

func typeText(str: String){
    for var i = 0; i < countElements(str); i++
    {
        
    }
}