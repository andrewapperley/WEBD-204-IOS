//
//  DataViewController.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-23.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class DataViewController: HelperViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Data and Delegates"
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    if let delegate = self.delegate {
      delegate.sendMessage("This is a message from DataViewController", from: self.indexPath)
    }
  }

}
