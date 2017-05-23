//
//  SoundTabViewController.swift
//  Teoteblung
//
//  Created by Banu Antoro on 4/16/16.
//  Copyright © 2016 Banu Antoro. All rights reserved.
//

import UIKit
import AVFoundation

class SoundTabViewController: UIViewController {

    @IBOutlet var buttonsContainer: UIView!
    
    var soundType:String?
    
    var buttons = [RDButton]()
    
    var audioPlayer:AVAudioPlayer!
    var motorTypes = ["A", "B", "C", "D"]
    
    var audioNames:[String: [String]] = ["animal":["Kodok-Jangkrik", "Kodok", "Krok", "Othe-othe", "Tonggeret"], "nature":["Ombak", "Hujan"]]
    
    
    
    var backgroundColors = [
        UIColor(red: 0.643, green: 0.561, blue: 0.212, alpha: 1.00),
        UIColor(red: 0.157, green: 0.475, blue: 0.251, alpha: 1.00),
        UIColor(red: 0.643, green: 0.271, blue: 0.212, alpha: 1.00),
        UIColor(red: 0.235, green: 0.180, blue: 0.443, alpha: 1.00)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var buttonWidth:CGFloat!
    var buttonHeight:CGFloat!
    
    override func viewDidAppear(_ animated: Bool) {
        
        let audios = audioNames[soundType!]
        let length = audios!.count
        
        buttonWidth = (buttonsContainer.bounds.width-(8 * CGFloat(length+1)))/CGFloat(length)
        buttonHeight = buttonsContainer.frame.size.height - 16
        
        for index in 0...(length-1) {
            
            let button = RDButton(frame: CGRect(x: (CGFloat(index) * (buttonWidth + 8)) + 8, y: 8, width: buttonWidth, height: buttonHeight))
            button.backgroundColor = UIColor.lightGray
            
            button.audioName(audios![index])
            
            let label = UILabel(frame: CGRect(x: 0, y: buttonHeight*2/3, width: buttonWidth, height: buttonHeight/3))
            label.textAlignment = NSTextAlignment.center
            label.textColor = UIColor.white
            label.numberOfLines = 2
            label.adjustsFontSizeToFitWidth = true
            
            label.text = audios![index]
            
            button.addSubview(label)
            buttons.append(button)
            
            buttonsContainer.addSubview(button)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
