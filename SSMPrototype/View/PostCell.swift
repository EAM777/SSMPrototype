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
    @IBOutlet weak var likesImg: UIImageView!
    
    
    
    var post: Post!
    var likesRef: DatabaseReference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 1
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }

    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        likesRef = DataService.ds.REF_USER_CURRENT.child("likes").child(post.postKey)
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
        
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likesImg.image = UIImage(named: "empty-heart")
            } else {
                self.likesImg.image = UIImage(named: "filled-heart")
                
            }
        })
        
        
        
    }
    
    @objc func likeTapped(sender: UITapGestureRecognizer) {
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likesImg.image = UIImage(named: "filled-heart")
                self.post.adjustable(addLike: true)
                self.likesRef.setValue(true)
                
                
            } else {
                self.likesImg.image = UIImage(named: "empty-heart")
                self.post.adjustable(addLike: false)
                self.likesRef.removeValue()
                
            }
        })
        
        
        
    }
    
}


