//
//  UIHelp_UITextField.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UITextField: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UITextField"

      let textField = UITextField()
      textField.placeholder = "Placeholder Text"

      stack.addArrangedSubview(textField)

      textField.heightAnchor.constraintEqualToConstant(50).active = true
    }

}
