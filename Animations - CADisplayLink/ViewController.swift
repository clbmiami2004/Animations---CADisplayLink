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
    var startValue = 0
    let endValue = 12000

    @objc func handleUpdate() {
//        let seconds = Date().timeIntervalSince1970
//        print(seconds)
//        self.countingLabel.text = "\(seconds)"
        
        self.countingLabel.text = "\(startValue)"
        startValue += 1
        
        if startValue > endValue {
            startValue = endValue
        }
    }

}

