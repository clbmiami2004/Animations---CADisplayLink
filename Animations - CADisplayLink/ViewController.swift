//
//  ViewController.swift
//  Animations - CADisplayLink
//
//  Created by Lambda_School_Loaner_201 on 1/26/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countingLabel: UILabel = {
        
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        //Create my CADisplayLink here:
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        
        displayLink.add(to: .main, forMode: .default)
    }
    
    //Starting the count from 0.
    var startValue: Double = 0
    let endValue: Double = 3000
    let animationDuration: Double = 3.5
    
    //Setting up the speed in which the app reaches the endValue:
    let animationStartDate = Date()
    

    @objc func handleUpdate() {
//        let seconds = Date().timeIntervalSince1970
//        print(seconds)
//        self.countingLabel.text = "\(seconds)"
        
//        self.countingLabel.text = "\(startValue)"
//        startValue += 1
//
//        if startValue > endValue {
//            startValue = endValue
//        }
        
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
            
        }else {
            
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.countingLabel.text = "\(value)"
        }
        
        
        
        
    }

}

