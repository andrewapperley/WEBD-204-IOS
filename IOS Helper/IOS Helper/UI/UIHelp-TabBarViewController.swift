//
//  UIHelp-TabBarViewController.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-12-07.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_TabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "UITabBarController"

    let v1 = UIViewController()
    v1.tabBarItem = UITabBarItem(title: "V1", image: nil, tag: 0)
    v1.view.backgroundColor = UIColor.redColor()

    let v2 = UIViewController()
    v2.tabBarItem = UITabBarItem(title: "V2", image: nil, tag: 1)
    v2.view.backgroundColor = UIColor.yellowColor()

    let v3 = UIViewController()
    v3.tabBarItem = UITabBarItem(title: "V3", image: nil, tag: 2)
    v3.view.backgroundColor = UIColor.grayColor()

    let v4 = UIViewController()
    v4.tabBarItem = UITabBarItem(title: "V4", image: nil, tag: 3)
    v4.view.backgroundColor = UIColor.purpleColor()

    self.viewControllers = [v1, v2, v3, v4]

  }

}