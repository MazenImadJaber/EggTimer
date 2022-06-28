//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eggsLabel: UILabel!
    var totalTime = 0;
    var secondsRemaining = 0
    var timer = Timer();
    let eggTimes = [ "Soft":3 , "Medium":4,"Hard": 7]

    @IBOutlet weak var EggsProgressBar: UIProgressView!
  

    
    @IBAction func hardnessSelceted(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!;
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
            secondsRemaining -= 1
        }else{
            timer.invalidate()
            eggsLabel.text = "How do you like your eggs?"
            EggsProgressBar.progress = 0;

        }
    }
    
}
