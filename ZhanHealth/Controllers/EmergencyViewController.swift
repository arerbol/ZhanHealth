//
//  EmergencyViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/18/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy
import AudioToolbox
import AVFoundation

class EmergencyViewController: UIViewController {
  
//  static let soundId: SystemSoundID? = {
//    guard let soundURL = Bundle.main.url(forResource: "Chirp", withExtension: "wav") else {
//      return nil
//    }
//
//    var soundId: SystemSoundID = 0
//    AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundId)
//    return soundId
//  }()
  
  var timer: Timer?
  
  lazy var mainView: EmergencyView = {
    let mv = EmergencyView()
    mv.sosButton.addTarget(self, action: #selector(sosTapped), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Emergency Call", style: .plain, target: self, action: nil)]
    loopSoundAndVibrate()
  }

  
  @objc func playSoundAndVibrate() {
    AudioServicesPlaySystemSound(SystemSoundID(1005))
    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
  }
  
  func loopSoundAndVibrate(){
    timer?.invalidate()
    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(playSoundAndVibrate), userInfo: nil, repeats: true)
  }
  
  @objc func sosTapped() {
    timer?.invalidate()
  }
  
}