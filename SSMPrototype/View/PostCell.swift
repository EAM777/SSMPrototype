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
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        self.caption.text = "\(post.caption)"
        self.likesLbl.text = "\(post.likes)"
        
        if img != nil {
            self.postImg.image = img
            
        } else {
            let ref = Storage.storage().reference(forURL: post.imageURL)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                    if error != nil {
                        print("SSMPT: unable to download Img from Firebase Storage")
                    } else {
                        print("SSMPT: Image downloaded from firebase storage")
                        if let imgData = data {
                            if let img = UIImage(data: imgData) {
                                self.postImg.image = img
                                FeedVC.imageCache.setObject(img, forKey: post.imageURL as NSString)
                        }
                    }
                        
                }
            })
        }
        
        
        
    }
    
}


