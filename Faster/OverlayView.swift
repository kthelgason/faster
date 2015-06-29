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
    
    func setSpeed(speed: Float) {
        let roundedSpeed = Float(Int(speed * 100)) / 100;
        self.speedLabel.text = roundedSpeed.description;
    }
    
}
