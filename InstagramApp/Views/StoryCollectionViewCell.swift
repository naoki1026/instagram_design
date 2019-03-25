//
//  StoryCollectionViewCell.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/23.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
  
  
  
  
  @IBOutlet weak var storyImage: UIImageView!
  @IBOutlet weak var useNameLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
      storyImage.layer.cornerRadius = storyImage.frame.width / 2
      storyImage.layer.masksToBounds = true
      storyImage.layer.borderColor = UIColor.white.cgColor
      storyImage.layer.borderWidth = CGFloat(3.0)
    
    }

}
