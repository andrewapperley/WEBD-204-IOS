//
//  UIHelp_UISwitch.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UISwitch: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UISwitch"

      let uiSwitch = UISwitch()
      uiSwitch.addTarget(self, action: #selector(switchValueChanged), forControlEvents: .ValueChanged)
      stack.addArrangedSubview(uiSwitch)
    }

  func switchValueChanged(sender: UISwitch) {
    let alert = UIAlertController(title: "UISwitch", message: "UISwitch value changed is on: \(sender.on)", preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}
