//
//  ViewController.swift
//  Faster
//
//  Created by Kari Tristan Helgason on 17/06/15.
//  Copyright © 2015 Kari Tristan Helgason. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func playVideo() {
        let videos = HCYoutubeParser.h264videosWithYoutubeURL(NSURL(string: "https://www.youtube.com/watch?v=sMDQOHdAlKM")) as NSDictionary;
        
        
        let playerVC = AVPlayerViewController();
        playerVC.player = AVPlayer(URL: NSURL(string: videos.objectForKey("medium") as! String)!);
        self.presentViewController(playerVC, animated: true, completion: nil);
        
        playerVC.player!.rate = 2.0;
    }

}

