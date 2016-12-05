//
//  AdvancedHelp-AudioPlayer.swift
//  IOS Helper
//
//  Created by Andrew Apperley on 2016-11-30.
//  Copyright © 2016 Humber College. All rights reserved.
//

import UIKit
import AVFoundation

class AdvancedHelp_AudioPlayer: HelperViewController {

  var player: AVAudioPlayer?

  override func viewDidLoad() {
    super.viewDidLoad()

    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("mpthreetest", ofType: "mp3")!)

    player = try! AVAudioPlayer(contentsOfURL: url)
    player?.prepareToPlay()
    player?.numberOfLoops = -1
    player?.volume = 0.5

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

  }

  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)

    player!.pause()
  }

  @objc private func play() {
    if !player!.playing {
      player!.play()
    }
  }

  @objc private func pause() {
    if player!.playing {
      player!.pause()
    }
  }

  @objc private func volumeUpdated(slider: UISlider) {
    player!.volume = slider.value
  }
}