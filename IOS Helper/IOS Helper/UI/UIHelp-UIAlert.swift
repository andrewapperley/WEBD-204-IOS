//
//  UIHelp_UIAlert.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIAlert: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIAlert"
    }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    let alert = UIAlertController(title: "This is an alert", message: "You can add body text", preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
    alert.addAction(UIAlertAction(title: "Cancel", style: .Destructive, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }

}