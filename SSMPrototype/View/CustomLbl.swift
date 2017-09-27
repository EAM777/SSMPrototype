//
//  CustomLbl.swift
//  SSMPrototype
//
//  Created by Elliot on 9/25/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit

class CustomLbl: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        
        
        layer.shadowOpacity = 20.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        
        layer.cornerRadius = 2.0

    }
}
