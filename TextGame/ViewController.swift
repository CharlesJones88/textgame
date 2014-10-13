//
//  ViewController.swift
//  TextGame
//
//  Created by Charles Jones on 9/20/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate
{

    
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var healthLvl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var potionLbl: UILabel!
    @IBOutlet weak var potionAmt: UILabel!
    @IBOutlet weak var userInput : UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userInput.delegate = self
        sleep(1)
        self.displayText.text = gameStart
    }

        
    func textFieldShouldReturn(userInput: UITextField!) -> Bool
    {
        var userMove: String!
        var showHealth: String
        userMove = userInput.text
        if player?.cName == nil
        {
            self.displayText.text = createHuman(&userMove)
        }
        
        else if !isBattle || userMove == "potion"
        {
            userMove = userMove.lowercaseString
            if userMove != "potion"
            {
                checkRand()
            }
            self.displayText.text = moveDirection(&userMove)
        }
        else
        {
            userMove = userMove.lowercaseString
            self.displayText.text = battleLoop(&userMove)
        }
        if self.healthLbl.text == ""
        {
            self.healthLbl.text = healthText
            self.potionLbl.text = potionText
        }
        self.healthLvl.text = String(player.cHealth)
        self.potionAmt.text = String(potionUse)
        userInput.text = ""
        return true
    }
}