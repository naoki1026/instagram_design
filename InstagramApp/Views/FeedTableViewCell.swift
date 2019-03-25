//
//  FeedTableViewCell.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/23.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
  
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var userNameTitleButton: UIButton!
  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var likesCountLabel: UILabel!
  @IBOutlet weak var postCommentLabel: UILabel!
  @IBOutlet weak var commentCountButton: UIButton!
  @IBOutlet weak var dateLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      profileImage.layer.cornerRadius = profileImage.frame.width / 2
      profileImage.layer.masksToBounds = true
      selectionStyle = UITableViewCell.SelectionStyle.none
      
    }

  
  
  
  
    
}
