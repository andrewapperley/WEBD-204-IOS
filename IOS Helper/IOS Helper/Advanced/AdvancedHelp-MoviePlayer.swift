//
//  AdvancedHelp-MoviePlayer.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-30.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AdvancedHelp_MoviePlayer: HelperViewController {

  var player: AVPlayerViewController!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Video Player"

    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("bunny", ofType: "mp4")!)
    player = AVPlayerViewController()
    let avPlayer = AVPlayer(URL: url)
    player.player = avPlayer

    let showButton = UIButton(type: .System)
    showButton.addTarget(self, action: #selector(showMovie), forControlEvents: .TouchUpInside)
    showButton.setTitle("Show Movie", forState: .Normal)
    stack.addArrangedSubview(showButton)

    showButton.translatesAutoresizingMaskIntoConstraints = false
    showButton.heightAnchor.constraintEqualToConstant(44).active = true
    showButton.centerXAnchor.constraintEqualToAnchor(stack.centerXAnchor).active = true

  }

  @objc private func showMovie() {
    self.presentViewController(player, animated: true, completion: nil)
  }


}
