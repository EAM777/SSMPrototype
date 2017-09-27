//
//  CIrcleView.swift
//  SSMPrototype
//
//  Created by Elliot on 9/26/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit

class CIrcleView: UIImageView {
    
    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        
        
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.width / 2
    }
    
}
