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
var isBattle: Bool! = false
var battleStart: Bool = true
var player: Human! = nil
let welcome: String! = "Hello \(player.cName), would you like to go North, South, East, or West?"
var monster: Monster! = nil
var potion = 10

func checkRand() -> Bool
{
    var random : Int = (Int)(arc4random_uniform(10))
    var compareNum = [1,3,5,9]
    for var i = 0; i < compareNum.count; i++
    {
        if random == compareNum[i]
        {
            isBattle = true
            return isBattle
        }
        else
        {
            isBattle = false
        }
    }
    return isBattle
}

func moveDirection(inout checkDir: String!) -> String
{
    var dir: String
    switch checkDir{
        case "north":
            dir = "You moved \(checkDir)."
                return dir
        case "south":
            dir = "You moved \(checkDir)."
                return dir
        case "east":
            dir = "You moved \(checkDir)."

                return dir
        case "west":
            dir = "You moved \(checkDir)."
                return dir
        default:
            return "You haven't moved yet."
    }
    
}

func battleLoop(inout response: String!) -> String
{
    var wrapper: String
    var goblin: String! = "goblin"
    if battleStart {
        monster = Monster(_name: &goblin)
        battleStart = false
    }
    if player.cHealth > 0 || monster.cHealth > 0
    {
        if monster.firstEncounter(){
            monster.disableFirstEncounter()
            return "You encountered a  \(monster.cName)! Would you like to attack or attempt to run?"
        }
        switch response
        {
            case "attack":
                player.attackMonster(&monster)
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return "You died!"
                }
                else
                {
                    return "You did damage \(player.cAttack) to \(monster.cName) and \(monster.cName) did \(monster.cAttack) to you!"
                }
            case "run":
                if checkRand() == false
                {
                    isBattle = false
                    return "Got away safely!"
                }
                else
                {
                    monster.attackHuman(&player)
                    if player.cHealth <= 0
                    {
                        isBattle = false
                        battleStart = true
                        monster.enableFirstEncounter()
                        return "You died!"
                    }
                    else
                    {
                        return "You tripped and the \(monster.cName) did \(monster.cAttack) damage to you!"
                    }
                }
            case "potion":
                player.cHealth += potion
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return "You died!"
                }
                else
                {
                    return "You healed yourself by \(potion) points! The \(monster.cName) did \(monster.cAttack) damage to you!"
                }
            default:
                return "I don't understand!"
        }
    }
    else if monster.cHealth <= 0
    {
            isBattle = false
            battleStart = true
            monster.enableFirstEncounter()
            var monsterDefeated = "You defeated the \(monster.cName)!"
            monster = nil
            return monsterDefeated
    }
    return "exit"
}

func createHuman(inout name: String!) -> String
{
    var newPlayer: Human! = Human(_name: &name)
    player = newPlayer
    return welcome
}
