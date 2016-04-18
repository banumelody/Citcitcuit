//
//  ViewController.swift
//  Citcitcuit
//
//  Created by Banu Antoro on 4/16/16.
//  Copyright © 2016 Banu Antoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondViewController = segue.destinationViewController as! SoundTabViewController
        secondViewController.soundType = segue.identifier
    }
    
}

