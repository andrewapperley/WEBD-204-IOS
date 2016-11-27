//
//  HelperViewController.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

protocol HelperDelegate {
  func sendMessage(text: String, from indexPath: NSIndexPath)
}

class HelperViewController: UIViewController {

  var stack = UIStackView()
  var textView = UITextView()
  internal var delegate: HelperDelegate?
  var indexPath: NSIndexPath!

  init(with text: String, delegate: HelperDelegate?) {
    super.init(nibName: nil, bundle: nil)
    textView.text = text
    self.delegate = delegate
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    view.addSubview(stack)

    stack.axis = .Vertical
    stack.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
    stack.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    stack.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
    stack.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true

    stack.translatesAutoresizingMaskIntoConstraints = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    stack.addArrangedSubview(textView)
  }

  func update(indexPath: NSIndexPath) {
    self.indexPath = nil
    self.indexPath = indexPath
  }

  deinit {
    self.indexPath = nil
    self.delegate = nil
  }

}
