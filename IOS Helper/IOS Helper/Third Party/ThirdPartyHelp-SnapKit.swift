//
//  ThirdPartyHelp-SnapKit.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-30.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit
import SnapKit

class ThirdPartyHelp_SnapKit: HelperViewController, UICollectionViewDataSource {

  let data = [UIColor.redColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.yellowColor()]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "SnapKit"

    let button = UIButton()
    button.backgroundColor = UIColor.greenColor()
    button.setTitle("Tap me", forState: .Normal)

    let _view = UIView()

    stack.addArrangedSubview(_view)

    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 80, height: 80)

    layout.scrollDirection = .Horizontal
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.backgroundColor = UIColor.clearColor()
    collectionView.dataSource = self

    _view.addSubview(collectionView)
    _view.addSubview(button)

    _view.snp_makeConstraints { (make) in
      make.height.equalTo(400)
      make.width.equalToSuperview()
    }

    collectionView.snp_makeConstraints { (make) in
      make.height.equalTo(300)
      make.width.equalToSuperview()
      make.top.equalTo(0)
    }

    button.snp_makeConstraints { (make) in
      make.top.equalTo(collectionView.snp_bottom)
      make.width.equalToSuperview()
      make.bottom.equalTo(0)
    }

  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
    cell.contentView.backgroundColor = data[indexPath.row]
    return cell
  }


}
