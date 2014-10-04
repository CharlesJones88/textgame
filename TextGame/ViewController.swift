//
//  ViewController.swift
//  TextGame
//
//  Created by Charles Jones on 9/20/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    
    @IBOutlet weak var displayText: UITextView!
    @IBOutlet weak var userInput : UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userInput.delegate = self
        view.addSubview(userInput)
        running = true
        sleep(2)
        self.displayText.text = "What is your name?"
        
    }

        
    func textFieldShouldReturn(userInput: UITextField!) -> Bool
    {
        var userMove: String!
        userMove = userInput.text
        userMove = userMove.lowercaseString
        checkRand()
        if player?.cName == nil
        {
            self.displayText.text = createHuman(&userMove)
        }
        else if !isBattle
        {
                self.displayText.text = moveDirection(&userMove)
        }
        else
        {
            self.displayText.text = battleLoop(&userMove)
        }
        userInput.text = ""
        return true
    }
}