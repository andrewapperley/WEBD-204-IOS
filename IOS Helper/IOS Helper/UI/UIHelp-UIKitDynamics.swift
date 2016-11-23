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
    gravity.addItem(square)
    collision.addItem(square)
    elasticity.addItem(square)
  }

}
