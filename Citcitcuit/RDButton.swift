//
//  RDButton.swift
//  Retetet Ndona
//
//  Created by Banu Antoro on 12/15/15.
//  Copyright © 2015 Banu Antoro. All rights reserved.
//

import UIKit
import AVFoundation

class RDButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var audioName:String!
    var audioPlayer:AVAudioPlayer!
    var audioPlayers = [AVAudioPlayer]()
    var index:Int! = 0
    var motorType:String! = "A"
    var playing = [Int]()
    
    var touchArea = UIView()
    var touchAreaSize = CGSize(width: 100.0, height: 100.0)
    var maxVol:CGFloat!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        maxVol = bounds.height
        
        touchArea.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: touchAreaSize)
        touchArea.backgroundColor = UIColor.clear
        touchArea.isHidden = true
        touchArea.layer.cornerRadius = 50
        touchArea.layer.borderColor = UIColor.blue.cgColor
        touchArea.layer.borderWidth = 5
        touchArea.clipsToBounds = true
        self.addSubview(touchArea)
        self.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        let location = touch.location(in: self)
        
        backgroundColor = UIColor(red: 1.0 - (location.y/maxVol), green: location.y/maxVol, blue: 0.0, alpha: 1.0)
        audioPlayers[index].currentTime = 0
        var volume = Float(1.0 - (location.y/(maxVol*4/5)))
        if (volume<=0.0) {
            volume = 0.0
        }
        audioPlayers[index].volume = volume
        audioPlayers[index].play()
        
        var touchX = location.x-50
        var touchY = location.y-50
        
        
        if (location.x <= 0) {
            touchX = -50
        }
        
        if (location.x >= bounds.width) {
            touchX = bounds.width - 50
        }
        
        if (location.y <= 0) {
            touchY = -50
        }
        
        if (location.y >= bounds.height) {
            touchY = bounds.height - 50
        }
        
        
        touchArea.isHidden = false
        touchArea.frame = CGRect(origin: CGPoint(x: touchX, y: touchY), size: touchAreaSize)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        //        let touch = touches.anyObject()! as UITouch
        let location = touch.location(in: self)
        var volume = Float(1.0 - (location.y/(maxVol*4/5)))
        if (volume<=0.0) {
            volume = 0.0
        }
        audioPlayers[index].volume = volume
        print(audioPlayers[index].volume)
        backgroundColor = UIColor(red: 1.0 - (location.y/maxVol), green: location.y/maxVol, blue: 0.0, alpha: 1.0)
        
        var touchX = location.x-50
        var touchY = location.y-50
        
        
        if (location.x <= 0) {
            touchX = -50
        }
        
        if (location.x >= bounds.width) {
            touchX = bounds.width - 50
        }
        
        if (location.y <= 0) {
            touchY = -50
        }
        
        if (location.y >= bounds.height) {
            touchY = bounds.height - 50
        }
        
        
        touchArea.isHidden = false
        touchArea.frame = CGRect(origin: CGPoint(x: touchX, y: touchY), size: touchAreaSize)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = UIColor.lightGray
        audioPlayers[index].stop()

        touchArea.isHidden = true

    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func audioName(_ audioName: String) {
        self.audioName = audioName
        
        let audioFilePath = Bundle.main.path(forResource: audioName, ofType: "wav")
        print(audioName)
        
        let audioFileUrl = URL(fileURLWithPath: audioFilePath!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: audioFileUrl, fileTypeHint: nil)
            audioPlayer.numberOfLoops = -1
            audioPlayers.append(audioPlayer)
        } catch {
            print("audio file is not found")
        }
        

    }
    
    func setAudioName(_ audioName: String, index: Int) {
        self.audioName = audioName
        
        let audioFilePath = Bundle.main.path(forResource: audioName, ofType: "wav")

        let audioFileUrl = URL(fileURLWithPath: audioFilePath!)
        
        print(audioName)
        do {
            try audioPlayers[0] = AVAudioPlayer(contentsOf: audioFileUrl, fileTypeHint: nil)
            audioPlayers[0].numberOfLoops = -1
        } catch {
            print("audio file is not found")
        }
    }
}
