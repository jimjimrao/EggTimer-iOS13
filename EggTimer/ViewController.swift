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
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var secondsRemaining = 60
    var totalSeconds = 60
    
    var timer = Timer()
    
    @IBOutlet weak var MainText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Additional setup if needed
        progressBar.progress = 1.0
        }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        
        timer.invalidate() // stops previous timer from continuing
        
        let hardness = sender.currentTitle!
        secondsRemaining = timeDict[hardness]!
        totalSeconds = secondsRemaining
        
        
        // re-initialize timer with new info
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }

    @objc func updateTimer(){
        progressBar.progress = (Float(secondsRemaining) / Float(totalSeconds))
        if secondsRemaining > 0 {
            MainText.text = String(secondsRemaining)
            secondsRemaining -= 1
        }
        else {
            timer.invalidate()
            MainText.text = "Done!"
        }
    }
        
    }

