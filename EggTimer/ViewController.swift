//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let timeDict : [String: Int] = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var totalTime = 60
    var secondsPassed = 60
    
    var timer = Timer()
    var audio: AVPlayer!
    
    func playAlarm() {
        // need to declare local path as url
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        // now use declared path 'url' to initialize the player
        audio = AVPlayer.init(url: url!)
        // after initialization play audio its just like click on play button
        audio.play()
    }
    
    @IBOutlet weak var MainText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Additional setup if needed
        progressBar.progress = 0.0
        }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() // stops previous timer from continuing
        MainText.text = "Eggs Boiling..."
        let hardness = sender.currentTitle!
        totalTime = timeDict[hardness]!
        secondsPassed = 0
        
        
        // re-initialize timer with new info
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }

    @objc func updateTimer(){
        let percentageProgress = Float(secondsPassed)/Float(totalTime)
        progressBar.progress = percentageProgress
        
        if secondsPassed < totalTime {
            secondsPassed += 1
        }else {
            playAlarm()
            timer.invalidate()
            MainText.text = "Done!"
        }
    }
        
    }

