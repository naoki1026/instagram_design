//
//  SearchBarContainerView.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/24.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {
  
  let searchBar: UISearchBar
  
  //searchBarの初期化
  init(customSearchBar: UISearchBar) {
    searchBar = customSearchBar
    super.init(frame: CGRect.zero)
    addSubview(searchBar)
  }
  
  convenience override init(frame: CGRect) {
    self.init(customSearchBar : UISearchBar())
    self.frame = frame
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    searchBar.frame = bounds
  }
  
}
