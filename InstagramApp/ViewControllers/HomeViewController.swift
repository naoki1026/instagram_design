//
//  HomeViewCell.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/20.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  
  @IBOutlet weak var tableView: UITableView!
  
  //lazyを頭につける
 lazy var posts : [Post] = {
    
    let model = Model()
    return model.postList
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //セルの高さ、
    tableView.estimatedRowHeight = CGFloat(88.0)
    
    //自動設定、88.0よりも大きくなる場合は自動調整ということかな
    tableView.rowHeight = UITableView.automaticDimension
    
    tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil ),forCellReuseIdentifier: "FeedTableViewCell")
    
    tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil ),forCellReuseIdentifier: "StoriesTableViewCell")
    
    //設定してあげないとセルが表示されない
    tableView.delegate = self
    tableView.dataSource = self
   
    //セルに値が入っている場合にのみ下の線を表示する
    tableView.tableFooterView = UIView()    
    
    //ナビゲーションバーの左側にsend_nav_iconというボタンを表示する
    
    var rightBarItemImage = UIImage(named: "send_nav_icon")
    
    rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)
    
    //ナビゲーションバーの右側にsend_nav_iconというボタンを表示する
  
    var letftBarItemImage = UIImage(named: "send_nav_icon")
    
    letftBarItemImage = letftBarItemImage?.withRenderingMode(.alwaysOriginal)
    
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: letftBarItemImage, style: .plain, target: nil, action: nil)
    
    //ナビゲーションバーの中心にlogo_bav_iconを表示する
    
    let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
    self.navigationItem.titleView = profileImageView
    
    
  }
  
  //セルの数を定義
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return posts.count + 1
  
  }
  
  //セルの中身を返却する
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      
    let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell")  as!  StoriesTableViewCell
      
    return cell
      
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
    
    let currentIndex = indexPath.row - 1
    
    let postData = posts[currentIndex]
    
    cell.profileImage.image = postData.user.profileImage
    cell.postImage.image = postData.postImage
    cell.dateLabel.text = postData.datePosted
    cell.likesCountLabel.text = "\(postData.likesCount) likes"
    cell.postCommentLabel.text = "postData.postComment"
    cell.userNameTitleButton.setTitle(postData.user.name, for: .normal)
    cell.commentCountButton.setTitle("View all \(postData.commentCount) comments", for: .normal)
    
    return cell
    
  }

}
