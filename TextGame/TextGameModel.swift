//
//  TextGameModel.swift
//  TextGame
//
//  Created by Charles Jones on 9/20/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

var response: String = ""
var running: Bool = false
var isBattle: Bool! = false
var battleStart: Bool = true
//Direction
var dir = "You moved "
//Monster pool
var goblin: String! = "goblin"
var gobHealth: Int! = 10
var gobAttack: Int! = 3
//Character objects
var player: Human! = nil
var monster: Monster! = nil
//Game text
let gameStart: String! = "What is your name?"
let welcome: String! = "Hello \(player.cName), would you like to go north, south, east or west?"
let healthText: String! = "Health: "
let potionText: String! = "Potions: "
let runSafe = "Got away safely!"
let monsterDefeated = "You defeated the \(monster.cName)! "
let moveDir = "Would you like to go north, south, east, or west?"
let runAttack = "Would you like to attack or attempt to run?"
//potions
let potion = 10
var potionUse = 0
var hasPotion: Bool!
let potionString = "potion"
let foundPotion: String = "and you found a \(potionString)!"

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

func checkPotion() -> Bool
{
    var random: Int = (Int)(arc4random_uniform(6))
    var compNum = [0,2,5]
    for var i = 0; i < compNum.count; i++
    {
        if random == compNum[i]
        {
            potionUse++
            hasPotion = true
            return hasPotion
        }
        else
        {
            hasPotion = false
        }
    }
    return hasPotion
}

func moveDirection(inout checkDir: String!) -> String
{
    switch checkDir
    {
        case "north":
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case "south":
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case "east":
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case "west":
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case "potion":
                return usePotion() + moveDir
        default:
            return "You haven't moved yet. " + moveDir
    }
    
}

func battleLoop(inout response: String!) -> String
{
    if battleStart {
        monster = Monster(name: &goblin, healthValue: &gobHealth, attackValue: &gobAttack)
        battleStart = false
    }
    if player.cHealth > 0 || monster.mHealth > 0
    {
        if monster.firstEncounter(){
            monster.disableFirstEncounter()
            return dir + response + ". " + "You've encountered a  \(monster.cName)! " + runAttack
        }
        switch response
        {
            case "attack":
                player.attackMonster(&monster)
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    player.cHealth = 0
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return "\(player.cName) died!"
                }
                else if monster.mHealth <= 0
                {
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return monsterDefeated + moveDir
                }
                else
                {
                    return "\(player.cName) attacked the \(monster.cName) and it took \(player.cAttack) damage. The \(monster.cName) attacked \(player.cName) and did \(monster.mAttack) damage! " + runAttack
                }
            case "run":
                if checkRand() == false
                {
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return runSafe + moveDir
                }
                else
                {
                    monster.attackHuman(&player)
                    if player.cHealth <= 0
                    {
                        running = false
                        isBattle = false
                        battleStart = true
                        monster.enableFirstEncounter()
                        return "\(player.cName) died!"
                    }
                    else
                    {
                        return "You tripped and the \(monster.cName) attacked you dealing \(monster.mAttack) damage! " + runAttack
                    }
                }
            case "potion":
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return "\(player.cName) died!"
                }
                else
                {
                    if potionUse > 0
                    {
                         return usePotion() + "The \(monster.cName) did \(monster.mAttack) damage to you! " + runAttack
                    }
                    else
                    {
                        return usePotion() + runAttack
                    }
                }
            default:
                return "I don't understand! " + runAttack
        }
    }
    return "exit"
}

func usePotion() -> String
{
    if potionUse > 0
    {
        player.cHealth += potion
        potionUse--
        return "You healed yourself by \(potion) points! "
    }
    else
    {
        return "You don't have any potions! "
    }
}

func createHuman(inout name: String!) -> String
{
    var newPlayer: Human! = Human(name: &name)
    player = newPlayer
    return welcome
}