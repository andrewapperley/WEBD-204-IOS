//
//  MainViewController.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-22.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit

struct Section {
  var title: String
  var elements: [Element]
}

struct Element {
  var title: String
  var viewController: HelperViewController
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HelperDelegate {

  let kCellIdentifier = "HelperElementCell"

  var data: [Section]!

  var tableview: UITableView?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Swift/iOS Helper"
    self.view.backgroundColor = UIColor.whiteColor()
    self.data = [
      Section(title: "UI", elements: [
        Element(title: "UIView", viewController: UIHelp_UIView(with: "UIView's are the building blocks of every UI component for iOS. They contain all the necessary functions and properties to support adding internal views, calculating points within them, animating properties such as width and height, and positioning itself on the screen or within another view.", delegate: self)),
        Element(title: "UIButton", viewController: UIHelp_UIButton(with: "UIButton's are the most widely used on screen controls for a user to interact with. They allow the user to tap them and have an action performed. You're able to add titles, images, actions, and anything else an UIView has access to as it's a subclass of UIView.", delegate: self)),
        Element(title: "UISwitch", viewController: UIHelp_UIView(with: "Not Done", delegate: self)),
        Element(title: "UILabel", viewController: UIHelp_UILabel(with: "UILabel's are used as Titles or Labels for other UI components, such as a Text Input. Similar to the web world where Labels indicate what an Input Field is for the iOS world uses the same concept. UILabel's can be used for other purposes but most of the time indicate what something else is or what to do in a certain situation.", delegate: self)),
        Element(title: "UIAlert", viewController: UIHelp_UIAlert(with: "An UIAlertView can be used to communicate with the user that an action needs to be done or that something went wrong. Common usecases are when the user is logging out or a network request failed and the user has the option to retry.", delegate: self)),
        Element(title: "UIImageView", viewController: UIHelp_UIImageView(with: "An UIImageView is used to display an image on screen. The image can be from the network or local to the application. To display a network image the data must first be downloaded. The image can also be a set of frames that make up an animated Image.", delegate: self)),
        Element(title: "UITextView", viewController: UIHelp_UIView(with: "Not Done", delegate: self)),
        Element(title: "UITextField", viewController: UIHelp_UIView(with: "Not Done", delegate: self)),
        Element(title: "UICollectionView", viewController: UIHelp_UIView(with: "Not Done", delegate: self)),
        Element(title: "UISlider", viewController: UIHelp_UISlider(with: "UISlider's are controls that allow the user to provide a value within two values. For instance if they wanted to change the volume of a song or skip ahead while watching a movie. You can edit the min/max values as well as the image that is used for the dragging part, or better known as the Thumb Image.", delegate: self)),
        Element(title: "UIAnimations", viewController: UIHelp_UIAnimations(with: "UIViewAnimation's are the easiest and most straightforward, yet powerful, ways to animate a component on iOS. You're able to animate position, size, colour, rotation, and constraints.", delegate: self)),
        Element(title: "UIKitDynamics", viewController: UIHelp_UIKitDynamics(with: "There is so much you can do with UIKit Dynamics. It's the built in physics/particle engine where you can manipulate UIView based components in a whole new way by adding gravity, collision detectors, desity, and more.", delegate: self))
          ]),
      Section(title: "Data", elements: [
        Element(title: "Delegates and Data", viewController: DataViewController(with: "This component demonstrates the use of a Delegate. By utilizing the delegate pattern we are able to call a function on an Object that we know nothing about, other than that it has a function called sendMessage that accepts a String and NSIndexPath.", delegate: self))
        ])
        ]
    tableview = UITableView()
    tableview?.delegate = self
    tableview?.dataSource = self
    tableview?.registerClass(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    self.view.addSubview(tableview!)

    tableview?.translatesAutoresizingMaskIntoConstraints = false
    tableview?.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
    tableview?.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    tableview?.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
    tableview?.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
  }

  //MARK: - UITableViewDataSource -
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return data.count
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data[section].elements.count
  }

  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return data[section].title
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = data[indexPath.section].elements[indexPath.row].title
    return cell
  }

  //MARK: - UITableViewDelegate -
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    let viewController = data[indexPath.section].elements[indexPath.row].viewController
    viewController.update(indexPath)
    self.navigationController?.pushViewController(viewController, animated: true)
  }

  //MARK: - HelperDelegate -
  func sendMessage(text: String, from indexPath: NSIndexPath) {
    let alert = UIAlertController(title: "Alert", message: "Section: \(indexPath.section) Row: \(indexPath.row) sent a message: \(text)", preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}