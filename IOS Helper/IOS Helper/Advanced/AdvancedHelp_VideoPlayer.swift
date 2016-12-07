//
//  AdvancedHelp_VideoPlayer.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-12-06.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit
import AVFoundation

class AdvancedHelp_VideoPlayer: HelperViewController {

  var player: AVPlayer?

  override func viewDidLoad() {
    super.viewDidLoad()

    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("bunny", ofType: "mp4")!)

    player = AVPlayer(URL: url)
    player?.volume = 0.5

    let playerView = UIView()
    playerView.backgroundColor = UIColor.redColor()
    playerView.translatesAutoresizingMaskIntoConstraints = false
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
    playerView.layer.addSublayer(playerLayer)

    let playButton = UIButton()
    playButton.translatesAutoresizingMaskIntoConstraints = false
    playButton.setImage(UIImage(named: "play"), forState: .Normal)
    playButton.imageView?.contentMode = .ScaleAspectFit
    playButton.addTarget(self, action: #selector(play), forControlEvents: .TouchUpInside)
    let pauseButton = UIButton()
    pauseButton.translatesAutoresizingMaskIntoConstraints = false
    pauseButton.setImage(UIImage(named: "pause"), forState: .Normal)
    pauseButton.imageView?.contentMode = .ScaleAspectFit
    pauseButton.addTarget(self, action: #selector(pause), forControlEvents: .TouchUpInside)
    let volumeSlider = UISlider()
    volumeSlider.translatesAutoresizingMaskIntoConstraints = false
    volumeSlider.maximumValue = 1.0
    volumeSlider.minimumValue = 0.0
    volumeSlider.setValue(0.5, animated: false)
    volumeSlider.addTarget(self, action: #selector(volumeUpdated), forControlEvents: .ValueChanged)

    let controls = UIView()

    controls.addSubview(playButton)
    controls.addSubview(pauseButton)
    controls.addSubview(volumeSlider)
    stack.addArrangedSubview(controls)
    stack.addArrangedSubview(playerView)

    controls.heightAnchor.constraintEqualToConstant(100).active = true

    playButton.heightAnchor.constraintEqualToConstant(50).active = true
    playButton.widthAnchor.constraintEqualToConstant(50).active = true
    playButton.leftAnchor.constraintEqualToAnchor(controls.leftAnchor, constant: 10).active = true
    playButton.topAnchor.constraintEqualToAnchor(controls.topAnchor).active = true

    pauseButton.heightAnchor.constraintEqualToConstant(50).active = true
    pauseButton.widthAnchor.constraintEqualToConstant(50).active = true
    pauseButton.leftAnchor.constraintEqualToAnchor(playButton.rightAnchor, constant: 10).active = true
    pauseButton.topAnchor.constraintEqualToAnchor(controls.topAnchor).active = true

    volumeSlider.widthAnchor.constraintEqualToConstant(90).active = true
    volumeSlider.leftAnchor.constraintEqualToAnchor(pauseButton.rightAnchor, constant: 10).active = true
    volumeSlider.centerYAnchor.constraintEqualToAnchor(pauseButton.centerYAnchor).active = true

    playerView.heightAnchor.constraintEqualToConstant(300).active = true

  }

  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)

    player!.pause()
  }

  @objc private func play() {
    player!.play()
  }

  @objc private func pause() {
    player!.pause()
  }

  @objc private func volumeUpdated(slider: UISlider) {
    player!.volume = slider.value
  }
}
