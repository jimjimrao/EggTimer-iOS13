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
    var secondsRemaining = 60
    
    var timer = Timer()
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // stops previous timer from continuing
        
        let hardness = sender.currentTitle!
        secondsRemaining = timeDict[hardness]!
      
        // re-initialize timer with new info
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }

    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
        
    }

