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
        self.displayText.text = "What is your name?"
        
    }

    func textFieldShouldReturn(userInput: UITextField!) -> Bool {
        returnTapped()
        userInput.text = ""
        return true
    }
    
    func returnTapped() {
        var userMove: String!
        if player?.lifeFormName == nil
        {
            userMove = userInput.text
            userMove = userMove.lowercaseString
            createHuman(&userMove)
            var wait = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector(displayWelcome()), userInfo: nil, repeats: false)
        }
        else
        {
            userMove = userInput.text
            userMove = userMove.lowercaseString
            displayText.text = checkState(&userMove)
        }
    }
    
    func displayWelcome() {
        self.displayText.text = welcome
    }
}

