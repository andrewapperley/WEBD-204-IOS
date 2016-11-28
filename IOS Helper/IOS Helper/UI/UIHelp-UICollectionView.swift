//
//  UIHelp_UICollectionView.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UICollectionView: HelperViewController, UICollectionViewDataSource {

  let data = [UIColor.redColor(), UIColor.blackColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.purpleColor(), UIColor.grayColor(), UIColor.cyanColor(), UIColor.brownColor(), UIColor.redColor(), UIColor.blackColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.purpleColor(), UIColor.grayColor(), UIColor.cyanColor(), UIColor.brownColor(), UIColor.redColor(), UIColor.blackColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.purpleColor(), UIColor.grayColor(), UIColor.cyanColor(), UIColor.brownColor(), UIColor.redColor(), UIColor.blackColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.purpleColor(), UIColor.grayColor(), UIColor.cyanColor(), UIColor.brownColor()]
  let kCellKey = "collectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UICollectionView"

      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .Horizontal
      layout.itemSize = CGSize(width: 90, height: 90)
      let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
      collectionView.backgroundColor = UIColor.clearColor()
      collectionView.layer.borderColor = UIColor.blackColor().CGColor
      collectionView.layer.borderWidth = 1
      collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellKey)
      collectionView.dataSource = self
      stack.addArrangedSubview(collectionView)

      collectionView.heightAnchor.constraintEqualToConstant(300).active = true
      collectionView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
    }

  //MARK: - UICollectionViewDataSource -
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellKey, forIndexPath: indexPath)
    cell.contentView.backgroundColor = data[indexPath.row]
    return cell
  }

}
