//
//  ViewController.swift
//  Citcitcuit
//
//  Created by Banu Antoro on 4/16/16.
//  Copyright © 2016 Banu Antoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    
    var frogImage: UIImage = UIImage(named:"frog.png")!
    var treeImage: UIImage = UIImage(named: "deciduous_tree.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frog = CGImageCreateWithImageInRect(frogImage.CGImage, CGRect(x: 650, y: 460, width: 250, height: 250))
        let tree = CGImageCreateWithImageInRect(treeImage.CGImage, CGRect(x: 800, y: 480, width: 250, height: 250))
        
        animalButton.setBackgroundImage(UIImage(CGImage: frog!), forState: UIControlState.Normal)
        natureButton.setBackgroundImage(UIImage(CGImage: tree!), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondViewController = segue.destinationViewController as! SoundTabViewController
        secondViewController.soundType = segue.identifier
        secondViewController.title = segue.identifier?.capitalizedString
    }
    
}

