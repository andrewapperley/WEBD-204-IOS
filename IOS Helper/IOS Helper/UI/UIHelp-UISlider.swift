//
//  UIHelp_UISlider.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UISlider: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "UISlider"
      let slider = UISlider()
      slider.setThumbImage(UIImage(named: "cat-icon"), forState: .Normal)
      slider.addTarget(self, action: #selector(UIHelp_UISlider.sliderChanged), forControlEvents: .ValueChanged)
      slider.addTarget(self, action: #selector(UIHelp_UISlider.sliderChangesEnded), forControlEvents: [.TouchUpInside, .TouchUpOutside])
      stack.addArrangedSubview(slider)
    }

  func sliderChanged(slider: UISlider) {
    slider.backgroundColor = UIColor.redColor()
  }

  func sliderChangesEnded(slider: UISlider) {
    slider.backgroundColor = UIColor.clearColor()
  }

}
