//
//  CutCorners.swift
//  SSMPrototype
//
//  Created by Elliot on 9/26/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit

class CutCorners: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: ABYSS_BLACK, green: ABYSS_BLACK, blue: ABYSS_BLACK, alpha: 0.6).cgColor
        
        
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.cornerRadius = 2.0
        
    }
}
