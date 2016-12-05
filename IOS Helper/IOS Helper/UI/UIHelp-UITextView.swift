//
//  UIHelp_UITextView.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UITextView: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UITextView"

      let textView = UITextView()
      textView.text = "This text can be \nplaced on \nmultiple \nlines"
      stack.addArrangedSubview(textView)

      textView.heightAnchor.constraintEqualToConstant(100).active = true
    }

}
