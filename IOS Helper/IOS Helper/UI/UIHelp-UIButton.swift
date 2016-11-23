//
//  UIHelp-UIButton.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIButton: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIButton"
      let redButton = UIButton()
      redButton.backgroundColor = UIColor.redColor()
      stack.addArrangedSubview(redButton)
      redButton.translatesAutoresizingMaskIntoConstraints = false
      redButton.heightAnchor.constraintEqualToConstant(50).active = true

      let titleButton = UIButton()
      titleButton.backgroundColor = UIColor.blackColor()
      titleButton.setTitle("Title Button", forState: .Normal)
      stack.addArrangedSubview(titleButton)
      titleButton.translatesAutoresizingMaskIntoConstraints = false
      titleButton.heightAnchor.constraintEqualToConstant(50).active = true

      let actionButton = UIButton()
      actionButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
      actionButton.setTitle("Tap Me!!", forState: .Normal)
      actionButton.backgroundColor = UIColor.yellowColor()
      actionButton.addTarget(self, action: #selector(UIHelp_UIButton.buttonTapped), forControlEvents: .TouchUpInside)
      stack.addArrangedSubview(actionButton)
      actionButton.translatesAutoresizingMaskIntoConstraints = false
      actionButton.heightAnchor.constraintEqualToConstant(50).active = true
    }

  func buttonTapped(button: UIButton) {
    button.setTitle("I was Tapped", forState: .Normal)
  }
}