//
//  UIHelp_UILabel.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UILabel: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UILabel"
      let label = UILabel()
      label.text = "This is a Label. It's meant for a single line of text"
      stack.addArrangedSubview(label)
    }

}
