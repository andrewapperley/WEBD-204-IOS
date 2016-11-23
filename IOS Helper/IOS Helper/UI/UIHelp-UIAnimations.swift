//
//  UIHelp_UIAnimations.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIAnimations: HelperViewController {

  let animatingView = UIView()
  var height: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIView Animation"

      animatingView.backgroundColor = UIColor.redColor()
      stack.addArrangedSubview(animatingView)

      height = animatingView.heightAnchor.constraintEqualToConstant(50)
      height!.priority = 800
      height!.active = true

      animate()
    }

  func animate() {
    view.layoutIfNeeded()
    UIView.animateWithDuration(0.4, animations: { 
      self.height!.constant = self.height!.constant * 1.1
      self.view.layoutIfNeeded()
      }) { (done) in
        if self.height!.constant >= self.view.bounds.height/2 {
          UIView.animateWithDuration(0.4, animations: { 
            self.height!.constant = 50
            self.view.layoutIfNeeded()
            }, completion: { (done) in
              self.animate()
          })
        } else {
          self.animate()
        }
    }
  }

}
