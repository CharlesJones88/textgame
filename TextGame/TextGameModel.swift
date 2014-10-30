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
let dir = "\(player.cName) moved "
let playerDead = "\(player.cName) died! "
var goblin: String! = "goblin"
var gobHealth: Int! = 10
var gobAttack: Int! = 3
var player: Human! = nil
var monster: Monster! = nil
let gameStart: String! = "What is your name? "
let welcome: String! = "Hello \(player.cName), would you like to go north, south, east or west? "
let healthText: String! = "Health: "
let potionText: String! = "Potions: "
let runSafe = "Got away safely!"
let monsterDefeated = "\(player.cName) defeated the \(monster.cName)! "
let encounter = "\(player.cName) encountered a  \(monster.cName)! "
let humanAttack = "\(player.cName) attacked the \(monster.cName) and it took \(player.cAttack) damage. "
let monsterAttack = "The \(monster.cName) attacked and did \(monster.mAttack) damage. "
let moveDir = "Would you like to go north, south, east, or west? "
let runAttack = "Would you like to attack or attempt to run? "
var invalidDir = "\(player.cName) hasn't moved yet. "
let endGame = "Game Over"
let north = "north"
let south = "south"
let east = "east"
let west = "west"
let attack = "attack"
let run = "run"
let potion = 10
var potionUse = 0
var hasPotion: Bool!
let potionString = "potion"
let foundPotion = "and you found a \(potionString)! "
let potionHeal = "\(player.cName) was healed by \(potion) points! "
let noPotions = "You don't have any potions! "
let invalidCommand = "I don't understand! "
let runIsFalse = "You tripped and fell! "

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
        case north:
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case south:
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case east:
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case west:
            checkPotion()
            if hasPotion == true
            {
                return dir + checkDir + " " + foundPotion + moveDir
            }
            else
            {
                return dir + checkDir + ". " + moveDir
            }
        case potionString:
                return usePotion() + moveDir
        default:
            return invalidDir + moveDir
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
            return dir + response + ". " + encounter + runAttack
        }
        switch response
        {
            case attack:
                player.attackMonster(&monster)
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    player.cHealth = 0
                    running = false
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return playerDead
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
                    return  humanAttack + monsterAttack + runAttack
                }
            case run:
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
                        player.cHealth = 0
                        running = false
                        isBattle = false
                        battleStart = true
                        monster.enableFirstEncounter()
                        return playerDead
                    }
                    else
                    {
                        return runIsFalse + monsterAttack + runAttack
                    }
                }
            case potionString:
                monster.attackHuman(&player)
                if player.cHealth <= 0
                {
                    player.cHealth = 0
                    running = false
                    isBattle = false
                    battleStart = true
                    monster.enableFirstEncounter()
                    return playerDead
                }
                else
                {
                    if potionUse > 0
                    {
                         return usePotion() + monsterAttack + runAttack
                    }
                    else
                    {
                        return usePotion() + runAttack
                    }
                }
            default:
                return invalidCommand + runAttack
        }
    }
    return endGame
}

func usePotion() -> String
{
    if potionUse > 0
    {
        player.cHealth += potion
        potionUse--
        return potionHeal
    }
    else
    {
        return noPotions
    }
}

func createHuman(inout name: String!) -> String
{
    var newPlayer: Human! = Human(name: &name)
    player = newPlayer
    return welcome
}