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
import MapKit

class EmergencyViewController: UIViewController {

  var timer: Timer?
  let conn = Connection()
  
  lazy var mainView: EmergencyView = {
    let mv = EmergencyView()
    mv.sosButton.addTarget(self, action: #selector(sosTapped), for: .touchUpInside)
    mv.instructionsButton.addTarget(self, action: #selector(sosTapped), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Emergency Call", style: .plain, target: self, action: nil)]
    loopSoundAndVibrate()
    sendTelegramMessage()
    sendSMS()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    timer?.invalidate()
  }
  
  func getCurrentLocation() -> CLLocation? {
    if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
      CLLocationManager.authorizationStatus() ==  .authorizedAlways){
      return locManager.location
    }
    return nil
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
    let centerVC = ProfileViewController()
    let centerNavVC = UINavigationController(rootViewController: centerVC)
    centerNavVC.navigationBar.barTintColor = .white
    centerNavVC.navigationBar.tintColor = .black
    centerNavVC.navigationBar.isTranslucent = false
    panel?.center(centerNavVC)
    panel?.openCenter(animated: true)
  }
  
  func sendTelegramMessage() {
    let bot = ZhanHealthBot()
    let user = conn.getAppUser()!
    var message = ""
    message += "\nFirstname: " + (user.firstname ?? "")
    message += "\nLastname: " + (user.lastname ?? "")
    message += "\nDate of birth: " + (user.medicalCard?.dob ?? "")
    message += "\nChronicle diseases: " + (user.medicalCard?.diseases ?? "")
    message += "\nBlood type: " + (user.medicalCard?.bloodType ?? "")
    message += "\nRhesus factor: " + (user.medicalCard?.rhesusFactor ?? "")
    if let currentLocation = getCurrentLocation() {
      message += "\nLocation: " + "\nhttps://maps.google.com/?q=\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
    }
    bot.sendMessage(message: message)
  }
  
  func sendSMS() {
    let sms = Sms()
    let user = conn.getAppUser()!
    var message = ""
    message += "Help Me! "
    message += user.firstname ?? ""
    message += " " + (user.lastname ?? "")
    if let currentLocation = getCurrentLocation() {
        message += "\nlatitude: \(currentLocation.coordinate.latitude), longitude: \(currentLocation.coordinate.longitude)"
    }
    for contact in user.contacts {
      sms.send(message: message, phone: contact.phone!)
    }
    
  }
  
}
