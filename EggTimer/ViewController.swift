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
    @IBOutlet weak var eggsLabel: UILabel!
    var totalTime = 0;
    var secondsRemaining = 0
    var timer = Timer();
    let eggTimes = [ "Soft":3 , "Medium":4 ,"Hard": 7]
   
    
    @IBOutlet weak var EggsProgressBar: UIProgressView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }
    
    @IBAction func hardnessSelceted(_ sender: UIButton) {
        if(player.isPlaying && secondsRemaining < -1){
            player.stop()
        }
        timer.invalidate()
        let hardness = sender.currentTitle!;
        eggsLabel.text = hardness
        EggsProgressBar.progress = 0;
        secondsRemaining = eggTimes[hardness]!
        totalTime  = eggTimes[hardness]!
        timer  = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
     
       
        
       
    }
    @objc func updateTimer() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds remaining to done!")
            secondsRemaining -= 1
            let doneness = Float(totalTime-secondsRemaining)/Float(totalTime)
            EggsProgressBar.progress = doneness;
        }else if secondsRemaining == 0{
            
            eggsLabel.text = "DONE!"
            player.play()
            secondsRemaining -= 1
        }else if secondsRemaining == -5{
            
            timer.invalidate()
            
            EggsProgressBar.progress = 0;
            eggsLabel.text = "Select hardness"
        }else{
            secondsRemaining -= 1

        }
    }

    
}
