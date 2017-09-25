//
//  TxtField.swift
//  SSMPrototype
//
//  Created by Elliot on 9/25/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit

class TxtField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        
        layer.borderWidth = 1.0

    layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
    
    
    layer.shadowOpacity = 0.8
    layer.shadowRadius = 5.0
    layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        
        layer.cornerRadius = 5.0

     }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
        
    }

}

