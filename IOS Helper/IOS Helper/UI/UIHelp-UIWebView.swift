//
//  UIHelp-UIWebView.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-30.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class UIHelp_UIWebView: HelperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      self.title = "Web View"
      let webView = UIWebView()
      webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.ca")!))
      stack.addArrangedSubview(webView)

      webView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
      webView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
      webView.heightAnchor.constraintEqualToConstant(300).active = true
  }

}