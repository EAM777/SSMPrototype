//
//  PostCell.swift
//  SSMPrototype
//
//  Created by Elliot on 9/27/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post) {
        self.post = post
        
        
        self.caption.text = "\(post.caption)"
        self.likesLbl.text = "\(post.likes)"
        
    }
    
}
