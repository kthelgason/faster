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
    @IBOutlet weak var playbackSpeedLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var rotationRecognizer: UIRotationGestureRecognizer!
    
    var playbackSpeed: Float = 1.0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        updateSpeedLabel();
    }
    
    func updateSpeedLabel() {
        let roundedSpeed = Float(Int(self.playbackSpeed * 100)) / 100;
        self.playbackSpeedLabel.text = roundedSpeed.description;
    }
    
    func playVideoAt(url: NSURL) {
        let videos = HCYoutubeParser.h264videosWithYoutubeURL(url) as NSDictionary;
        
        
        let playerVC = AVPlayerViewController();
        playerVC.player = AVPlayer(URL: NSURL(string: videos.objectForKey("medium") as! String)!);
        self.presentViewController(playerVC, animated: true, completion: nil);
        
        playerVC.player!.rate = self.playbackSpeed;
    }
    
    func displayError() {
        
        let alert = UIAlertController(title: "Error",
            message: "The URL entered was invalid",
            preferredStyle: UIAlertControllerStyle.Alert);
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    @IBAction func rotationRecognized(sender: UIRotationGestureRecognizer) {
        //print("rotation: \(sender.rotation)");
        self.playbackSpeed = min(max(Float(sender.rotation), 0.0), 4.0);
        
        updateSpeedLabel();
    }
    
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
        if let url = NSURL(string: self.urlField.text!) {
            self.playVideoAt(url);
        } else {
            displayError();
        }
    }

}

