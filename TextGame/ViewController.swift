//
//  ViewController.swift
//  TextGame
//
//  Created by Charles Jones on 9/20/14.
//  Copyright (c) 2014 Charles Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var displayText: UITextView!
    @IBOutlet var userInput : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userInput.delegate = self
        view.addSubview(userInput)
        running = true
        sleep(2)
        displayText.text = "Welcome to the world of stuff! Would you like to move north, south, east, or west?"
    }

    func textFieldShouldReturn(userInput: UITextField!) -> Bool {
        returnTapped()
        userInput.text = ""
        return true
    }
    
    func returnTapped() {
        var userMove = userInput.text
        userMove = userMove.lowercaseString
        if checkRand() == false{
            displayText.text = moveDirection(&userMove)
        }
        else if checkRand() == true{
            displayText.text = battleLoop(&userMove)
        }
    }
    
    func nextLine(sender: AnyObject) {
        userInput.returnKeyType = UIReturnKeyType.Next
    }
}

