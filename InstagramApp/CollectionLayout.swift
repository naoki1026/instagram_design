//
//  File.swift
//  InstagramApp
//
//  Created by Naoki Arakawa on 2019/03/24.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit

class CollectionLayout: UICollectionViewLayout {
  
  //同一ソースファイル内のアクセスのみを許可する
  //ここを変更しても特に変化はなかった・・・
  //numberOfColumsは列の数を意味する
  fileprivate var numberOfColums: Int = 3
  
  //CGFloatはざ座標指定するときの型
  //セルの余白
  fileprivate var cellPadding : CGFloat = 3
  
  //各IndexPathのセルのレイアウト属性はUICollectionViewLayoutAttributesというクラスで管理する
  //prepareLayout()というメソッドが呼ばれて、各IndexPathのレイアウト属性を一旦すべて計算した後に、位置やサイズが決まる
  fileprivate var cache = [UICollectionViewLayoutAttributes]()

  //幅を定義
  fileprivate var contentWidth : CGFloat  {
    //collectionViewに表示するものがない場合、幅は0
    guard let collectionView = collectionView else  { return 0 }
    //collectionViewnのtopから画面上までがInset
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right) - (cellPadding * (CGFloat(numberOfColums) - 1 ))
  }
  
  //高さを定義
  fileprivate var contentHeight : CGFloat = 0
  
  //必ず定義しなければいけないもの
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func prepare () {
    guard cache.isEmpty == true, let collectionView = collectionView else { return }
    
    //ここでセルの列の数を定義している
    let itemsPerRow : Int = 3
    
    //collectionViewの幅をセルの数で割ったものが幅
    let normalColumnWidth : CGFloat = contentWidth / CGFloat(itemsPerRow)
    
    //セルの高さはセルの幅と同じ大きさとなっている
    let normalColumnHeight : CGFloat = normalColumnWidth
    
  
    let featuredColumnWidth : CGFloat = (normalColumnWidth * 2) + cellPadding
    let featuredColumnHeight : CGFloat = featuredColumnWidth
    
    
   ////////////////////////////////////////////////////////////////////////////////////////////
    
    var xOffsets : [CGFloat] = [CGFloat]()
    
    //横に５行
    for item in 0..<6 {
      let multiplier = item % 3
      let xPos = CGFloat(multiplier) *  (normalColumnWidth + cellPadding)
      xOffsets.append(xPos)
    }
    
    xOffsets.append(0.0)
    
    for _ in 0..<2 {
      xOffsets.append(featuredColumnWidth + cellPadding)
    }
    
   ////////////////////////////////////////////////////////////////////////////////////////////
    
    var yOffsets : [CGFloat] = [CGFloat]()
    
    for item  in 0..<9 {
      
      //ここが原因だ！！！！！！！！！！！
      //カッコだけでこんなにレイアウトが変わる・・・恐ろしいや
      var _yPos = floor(Double(item / 3)) * (Double(normalColumnHeight) + Double(cellPadding))
      
//      var _yPos = floor(Double(item / 3) * (Double(normalColumnHeight)) + Double(cellPadding))
//
      //大きい画像の時の場合
      if item == 8 {
        _yPos += (Double(normalColumnHeight) + Double(cellPadding))
      }
      
      yOffsets.append(CGFloat(_yPos))
      
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    let numberOfItemsPerSection : Int = 9
    let heightOfSection : CGFloat = 4 * normalColumnHeight + (4 *  cellPadding)
    var itemInSection : Int = 0
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      
      let indexPath = IndexPath(item: item, section: 0)
      let xPos = xOffsets[itemInSection]
      let multiplier : Double  = floor(Double(item) / Double(numberOfItemsPerSection))
      let yPos = yOffsets[itemInSection] + (heightOfSection * CGFloat(multiplier))
      
      var cellWidth  = normalColumnWidth
      var cellHeight = normalColumnHeight
      
      if (itemInSection + 1) % 7 == 0 && itemInSection != 0 {
        cellWidth = featuredColumnWidth
        cellHeight = featuredColumnHeight
      }
      
      let frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
      let attributes = UICollectionViewLayoutAttributes(forCellWith:  indexPath)
      attributes.frame = frame
      cache.append(attributes)
      contentHeight = max(contentHeight, frame.maxY)
      itemInSection = itemInSection < (numberOfItemsPerSection - 1) ? (itemInSection + 1) : 0
      
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
    for attributes in cache {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
        
      }
    }
    
    return visibleLayoutAttributes
    
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    
    return cache[indexPath.item]
    
  }
  
}

