//
//  BackPack.swift
//  TextGame
//
//  Created by Charles Jones on 11/1/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import Foundation

let MAX_ITEMS: Int = 2

class BackPack
{
    var items: Int
    var bagFull: Bool
    init()
    {
        items = 0
        bagFull = false
    }
    
    func addItem()
    {
        if items != MAX_ITEMS
        {
            items++
        }
        else
        {
            bagFull = true
        }
    }
    
    func getItems() -> Int
    {
        return items
    }
    
    func removeItem()
    {
        items--
    }
    
    func isFull() -> Bool
    {
        if bagFull
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func empty() -> Bool
    {
        if items == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}