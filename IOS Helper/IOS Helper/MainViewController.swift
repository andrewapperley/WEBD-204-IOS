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
  var viewController: UIViewController
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
        Element(title: "UISwitch", viewController: UIHelp_UISwitch(with: "UISwitch's are used as toggles. They can turn settings on or off. Mostly used on Settings Views paired with an UILabel so the user knows what the Switch is changing.", delegate: self)),
        Element(title: "UILabel", viewController: UIHelp_UILabel(with: "UILabel's are used as Titles or Labels for other UI components, such as a Text Input. Similar to the web world where Labels indicate what an Input Field is for the iOS world uses the same concept. UILabel's can be used for other purposes but most of the time indicate what something else is or what to do in a certain situation.", delegate: self)),
        Element(title: "UIAlert", viewController: UIHelp_UIAlert(with: "An UIAlertView can be used to communicate with the user that an action needs to be done or that something went wrong. Common usecases are when the user is logging out or a network request failed and the user has the option to retry.", delegate: self)),
        Element(title: "UIImageView", viewController: UIHelp_UIImageView(with: "An UIImageView is used to display an image on screen. The image can be from the network or local to the application. To display a network image the data must first be downloaded. The image can also be a set of frames that make up an animated Image.", delegate: self)),
        Element(title: "UITextField", viewController: UIHelp_UITextField(with: "The UITextField is the way for users to input text, usually as part of a form (ie. Sign up or Sign in forms). There can be placeholder text to let the user know what is expected to be entered.", delegate: self)),
        Element(title: "UITextView", viewController: UIHelp_UITextView(with: "Similar to the UITextField, this component allows the user to input text but the major difference is that the UITextView supports multiple lines of text.", delegate: self)),
        Element(title: "UICollectionView", viewController: UIHelp_UICollectionView(with: "UICollectionView's are used to display data in a non-linear fashion. The main difference between it and an UITableView is that it can scroll both vertical and horizontal. Other difference includes the use of a Layout object that defines how the Cells will be laid out and that it doesn't inherently handle headers or footers.", delegate: self)),
        Element(title: "UISlider", viewController: UIHelp_UISlider(with: "UISlider's are controls that allow the user to provide a value within two values. For instance if they wanted to change the volume of a song or skip ahead while watching a movie. You can edit the min/max values as well as the image that is used for the dragging part, or better known as the Thumb Image.", delegate: self)),
        Element(title: "UIAnimations", viewController: UIHelp_UIAnimations(with: "UIViewAnimation's are the easiest and most straightforward, yet powerful, ways to animate a component on iOS. You're able to animate position, size, colour, rotation, and constraints.", delegate: self)),
        Element(title: "UIKitDynamics", viewController: UIHelp_UIKitDynamics(with: "There is so much you can do with UIKit Dynamics. It's the built in physics/particle engine where you can manipulate UIView based components in a whole new way by adding gravity, collision detectors, desity, and more.", delegate: self)),
        Element(title: "UIWebView", viewController: UIHelp_UIWebView(with: "UIWebView's are the way to get the web inside your app. The most common usecases for webviews are contact forms, external links (to keep the user in the app), and Web Apps. Another less common usecase is to display content within dynamic HTML, (ie. Charts).", delegate: self)),
        Element(title: "UITabbarController", viewController: UIHelp_TabBarViewController())
          ]),
      Section(title: "Data", elements: [
        Element(title: "Delegates and Data", viewController: DataViewController(with: "This component demonstrates the use of a Delegate. By utilizing the delegate pattern we are able to call a function on an Object that we know nothing about, other than that it has a function called sendMessage that accepts a String and NSIndexPath.", delegate: self))
        ]),
      Section(title: "Advanced", elements: [
        Element(title: "Sharing", viewController: AdvancedHelp_Sharing(with: "Not Done", delegate: self)),
        Element(title: "Photo Library", viewController: AdvancedHelp_PhotoLibrary(with: "This component demonstrates how to display the users photo library, even the iCloud images and let them pick one. Usually used for Profile Image selection or Attaching an image to a message. Once the user select an image you can manipulate it or use it directly.", delegate: self)),
        Element(title: "Movie/Audio Player", viewController: AdvancedHelp_MoviePlayer(with: "Similar to AVAudioPlayer, this component plays audio files but provides you with a full screen UI experience out of the box. It also plays Movie files, which is primarily it's usecase.", delegate: self)),
//        Element(title: "Video Player", viewController: AdvancedHelp_VideoPlayer(with: "To play video files within custom UI the AVPlayer is your best option. It lets you hook into duration, play, pause, stop, and progress events of the current video file but leaves setting up the UI to you.", delegate: self)),
        Element(title: "Audio Player", viewController: AdvancedHelp_AudioPlayer(with: "To play audio files within custom UI the AVAudioPlayer is your best option. It lets you hook into duration, play, pause, stop, and progress events of the current audio file but leaves setting up the UI to you.", delegate: self))
        ]),
      Section(title: "Third Party Components", elements: [
        Element(title: "SnapKit (Auto Layout)", viewController: ThirdPartyHelp_SnapKit(with: "This component shows the power of SnapKit, a wrapper for Auto Layout. It mixes the power of Auto Layout and letting you construct your constraints in plain English, while taking the heavy lifting away from you.", delegate: self))
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
    if viewController is HelperViewController {
      let helperController = viewController as! HelperViewController
      helperController.update(indexPath)
    }
    self.navigationController?.pushViewController(viewController, animated: true)
  }

  //MARK: - HelperDelegate -
  func sendMessage(text: String, from indexPath: NSIndexPath) {
    let alert = UIAlertController(title: "Alert", message: "Section: \(indexPath.section) Row: \(indexPath.row) sent a message: \(text)", preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}