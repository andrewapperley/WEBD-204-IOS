//
//  UIHelp-UIView.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIView: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIView"
      let top = UIView()
      top.backgroundColor = UIColor.redColor()
      top.layer.borderWidth = 2
      top.layer.borderColor = UIColor.blueColor().CGColor
      top.layer.cornerRadius = 5
      stack.addArrangedSubview(top)

      top.translatesAutoresizingMaskIntoConstraints = false
      top.heightAnchor.constraintEqualToConstant(100).active = true

      let bottom = UIView()
      bottom.backgroundColor = UIColor.grayColor()
      bottom.layer.borderWidth = 1
      bottom.layer.borderColor = UIColor.yellowColor().CGColor
      bottom.layer.cornerRadius = 50
      stack.addArrangedSubview(bottom)

      bottom.translatesAutoresizingMaskIntoConstraints = false
      bottom.heightAnchor.constraintEqualToConstant(100).active = true
    }

}
