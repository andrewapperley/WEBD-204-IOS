//
//  UIHelp_UIKitDynamics.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIKitDynamics: HelperViewController {

  var animator: UIDynamicAnimator!
  var gravity: UIGravityBehavior!
  var collision: UICollisionBehavior!
  var elasticity: UIDynamicItemBehavior!
  let square = UIView()
  var token: dispatch_once_t = 0

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIKit Dynamics"

      let container = UIView()
      container.layer.borderColor = UIColor.blackColor().CGColor
      container.layer.borderWidth = 2
      stack.addArrangedSubview(container)
      container.heightAnchor.constraintEqualToConstant(300).active = true

      animator = UIDynamicAnimator(referenceView: container)

      gravity = UIGravityBehavior(items: [])
      animator.addBehavior(gravity)

      collision = UICollisionBehavior()
      collision.translatesReferenceBoundsIntoBoundary = true
      animator.addBehavior(collision)

      elasticity = UIDynamicItemBehavior()
      elasticity.elasticity = 1
      animator.addBehavior(elasticity)

      square.translatesAutoresizingMaskIntoConstraints = false
      square.backgroundColor = UIColor.blackColor()
      container.addSubview(square)
      square.topAnchor.constraintEqualToAnchor(container.topAnchor).active = true
      square.leftAnchor.constraintEqualToAnchor(container.leftAnchor, constant: 25).active = true
      square.widthAnchor.constraintEqualToConstant(20).active = true
      square.heightAnchor.constraintEqualToConstant(20).active = true
    }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    dispatch_once(&token) {
      self.gravity.addItem(self.square)
      self.collision.addItem(self.square)
      self.elasticity.addItem(self.square)
    }
    gravity.gravityDirection = CGVector(dx: 0.1, dy: 1)
  }

  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    gravity.gravityDirection = CGVector(dx: -1, dy: -1)
  }

}
