//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeDict : [String: Int] = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    func countdown(seconds: Int) {
        var remainingSeconds = seconds
        
        while remainingSeconds > 0 {
            print("\(remainingSeconds) seconds.")
            remainingSeconds -= 1
            sleep(1) // Pauses execution for 1 second
        }
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = timeDict[hardness]!
        print(result)
        countdown(seconds: result)
        
        }
        
    }

