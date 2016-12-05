//
//  AdvancedHelp-PhotoLibrary.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-30.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

class AdvancedHelp_PhotoLibrary: HelperViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  var photos: UIImagePickerController!
  let photo = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Photo Library"

    stack.addArrangedSubview(photo)
    photo.contentMode = .ScaleAspectFit
    photo.translatesAutoresizingMaskIntoConstraints = false
    photo.heightAnchor.constraintEqualToConstant(100).active = true

    photos = UIImagePickerController()
    photos.delegate = self

    let showButton = UIButton(type: .System)
    showButton.addTarget(self, action: #selector(showPhotos), forControlEvents: .TouchUpInside)
    showButton.setTitle("Show Photos", forState: .Normal)
    stack.addArrangedSubview(showButton)

    showButton.translatesAutoresizingMaskIntoConstraints = false
    showButton.heightAnchor.constraintEqualToConstant(44).active = true
    showButton.centerXAnchor.constraintEqualToAnchor(stack.centerXAnchor).active = true
  }

  @objc private func showPhotos() {
    self.presentViewController(photos, animated: true, completion: nil)
  }

  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    photo.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }

}