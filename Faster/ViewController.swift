//
//  ViewController.swift
//  Faster
//
//  Created by Kari Tristan Helgason on 17/06/15.
//  Copyright © 2015 Kari Tristan Helgason. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:     AVPlayer?;
    var playerItem: AVPlayerItem?;
    
    override func viewDidLoad() {
        let url = NSURL(fileURLWithPath: "https://youtu.be/DMtwq3QtddY");
        player = AVPlayer(URL: url);
        
    }

}

