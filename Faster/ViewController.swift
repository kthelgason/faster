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
    
    var playbackSpeed: Float = 1.0;
    var lastRotation: Float = 0.0;
    let playerVC = AVPlayerViewController();
    
    let overlayView = NSBundle.mainBundle().loadNibNamed("OverlayView", owner: nil, options: nil)[0] as! OverlayView
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func playVideoAt(url: NSURL) {
        let videos: NSDictionary = HCYoutubeParser.h264videosWithYoutubeURL(url);
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("rotationRecognized:"));

        // TODO: Select highest profile
        playerVC.player = AVPlayer(URL: NSURL(string: videos.objectForKey("medium") as! String)!);
        playerVC.view.addGestureRecognizer(rotationRecognizer);
        
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
    
    func rotationRecognized(sender: UIRotationGestureRecognizer) {
        let delta = Float(sender.rotation) - self.lastRotation;
        print("rotation: \(sender.rotation), delta: \(delta)");
        self.playbackSpeed += delta * 0.3;
        self.playbackSpeed = min(max(self.playbackSpeed, 0.1), 2.0);
        self.lastRotation = Float(sender.rotation);
        
        playerVC.player?.rate = self.playbackSpeed;
        overlayView.setSpeed(self.playbackSpeed);
        
        overlayView.frame = self.view.frame;

        playerVC.contentOverlayView?.addSubview(overlayView);
        
    }
    
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
        if let url = NSURL(string: self.urlField.text!) {
            self.playVideoAt(url);
        } else {
            displayError();
        }
    }

}

