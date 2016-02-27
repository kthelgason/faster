//
//  OverlayView.swift
//  Faster
//
//  Created by Kari Tristan Helgason on 29/06/15.
//  Copyright © 2015 Kari Tristan Helgason. All rights reserved.
//

import Foundation
import UIKit

class OverlayView: UIView {
    
    @IBOutlet weak var speedLabel: UILabel!
    
    var timer: NSTimer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.clipsToBounds = true;
        
    }
    
    func hideLabel() {
        print("Timer fired");
        UIView.animateWithDuration(1.0) {
            self.speedLabel.alpha = 0.0;
        }
    }

    
    func setSpeed(speed: Float) {
        UIView.animateWithDuration(0.4) {
            self.speedLabel.alpha = 1.0;
        }
        self.timer?.invalidate();
        self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(4.0), target: self, selector: "hideLabel", userInfo: nil, repeats: false);
        let roundedSpeed = Float(Int(speed * 100)) / 100;
        self.speedLabel.text = "Playback speed: \(roundedSpeed.description)";
    }
    
}
