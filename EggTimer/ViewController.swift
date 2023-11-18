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

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = timeDict[hardness]!
        print(result)
        
        }
        
    }

