//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/20.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  lazy var posts : [Post] = {
    
    let model = Model()
    return model.postList
    
  }()

  @IBOutlet weak var collectionView: UICollectionView!
  
  var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      collectionView.delegate = self
      collectionView.dataSource = self
      searchController = UISearchController(searchResultsController: nil)
      
      //ユーザーが検索バーで文字を入力した時に、すぐに検索結果を表示してくれる
      searchController.obscuresBackgroundDuringPresentation = true
      
      //キャンセルボタンを無効にしている
      searchController.searchBar.showsCancelButton = false
      
      for subView in searchController.searchBar.subviews {
        
        for subView1 in subView.subviews {
          
          if let textField = subView1 as? UITextField {
            
            textField.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.93, alpha: 1.0)
            
            //テキストを中央寄せにする
            textField.textAlignment = NSTextAlignment.center
          }
        }
      }
      
      //検索する際の条件を定義している
      searchController.dimsBackgroundDuringPresentation  = false
      searchController.definesPresentationContext = true
      searchController.hidesNavigationBarDuringPresentation = false
      
      //ここでsearchBarContinerViewを参照している
      let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
      
      searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
      
      navigationItem.titleView = searchBarContainer
      
    }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return posts.count
  
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
    
    cell.exploreImage.image = posts[indexPath.row].postImage
    
    return cell
    
  }
}
