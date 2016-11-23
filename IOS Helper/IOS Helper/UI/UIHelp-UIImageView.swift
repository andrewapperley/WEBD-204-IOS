//
//  UIHelp_UIImageView.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIImageView: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UIImageView"
      let imageView = UIImageView(image: UIImage(named: "cats-politics"))
      imageView.contentMode = .ScaleAspectFit
      stack.addArrangedSubview(imageView)
    }

}
