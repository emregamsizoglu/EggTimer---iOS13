//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE"
            
        }
    }
    
    /*
     
     let hardness = sender.currentTitle -----> fonksiyonun içinde bu şekilde de kullanılabilir
     
     if hardness == "Soft" {
         print(eggTİme["soft"]!)  // !: isareti kullanılması variable'ın nil'e eşit olmucağı anlamına gelir
     }
     else if hardness == "Medium" {
         print(eggTİme["medium"]!)
     }
     else {
         print(eggTİme["hard"]!)
     }
     
     */
}
