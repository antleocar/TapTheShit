//
//  ViewController.swift
//  TapThisShit
//
//  Created by Antonio León on 18/4/17.
//  Copyright © 2017 Antonio León. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerCounterLabel: UILabel!
    @IBOutlet weak var pointsCounterLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    

    var timer = Timer()
    
    var timerCounter = 0
    var pointsCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerCounter = 10
        pointsCounter = 0
        
        timerCounterLabel.text = "\(timerCounter)"
        pointsCounterLabel.text = "\(pointsCounter)"
        tapButton.isUserInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapFunction(_ sender: Any) {
        pointsCounter += 1
        pointsCounterLabel.text = "\(pointsCounter)"
        
        
    }
    
    @IBAction func start(_ sender: Any) {
        
        if timerCounter == 10 {
            pointsCounter = 0
            pointsCounterLabel.text = "\(pointsCounter)"
            
            tapButton.isUserInteractionEnabled = true
            tapButton.alpha = 1
            
            startButton.isUserInteractionEnabled = false
            startButton.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
        }
        
        if timerCounter == 0 {
            
            timerCounter = 10
            pointsCounter = 0
                        
            timerCounterLabel.text = "\(timerCounter)"
            pointsCounterLabel.text = "\(pointsCounter)"
            
            startButton.setTitle("START", for: [])
            
        }
        
    }
    
    
    func startCounter()  {
        
        timerCounter -= 1
        timerCounterLabel.text = "\(timerCounter)"
        
        if timerCounter == 0 {
            timer.invalidate()
            
            startButton.isUserInteractionEnabled = true
            startButton.alpha = 1
            
            tapButton.isUserInteractionEnabled = false
            tapButton.alpha = 0.5
            
            startButton.setTitle("RESTART", for: [])
            
        }
        
        
    }


}

