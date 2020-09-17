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
    var player: AVAudioPlayer!
    var countDownTimer = Timer()
    var endTime = 0
    var time = 0
    let hardnessArray = ["Soft" : 5, "Medium" : 420, "Hard" : 720]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eggProgressBard: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        countDownTimer.invalidate()
        time = 1
        eggProgressBard.progress = 0
        endTime = hardnessArray[sender.currentTitle!]!
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        print("\(time) seconds.")
        eggProgressBard.setProgress(Float(time) / Float(endTime), animated: true)
        time += 1
        
        if(time > endTime) {
            endTimer()
        }
    }
    
    func endTimer() {
        titleLabel.text = "DONE!"
        countDownTimer.invalidate()
        playAlarm()
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
