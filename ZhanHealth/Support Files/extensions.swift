//
//  extensions.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/16/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import FAPanels

// Extension для увеличения размеров пропорционально
extension Int{
  func heightProportion() -> CGFloat {
    return CGFloat(self)*Screen.heightProportion
  }
  func widthProportion() -> CGFloat {
    return CGFloat(self)*Screen.widthProportion
  }
}

// Extensions для ViewController
extension UIViewController {
// Добавляет жест, которая убирает клавиатуру при нажатии на пустое место
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
// Функция, убрать клавиатуру
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
// Показывает toast, используется для результата
  func showToast(message: String) {
    
    let toastWidth = Screen.width-40.widthProportion()
    let toastHeight = 35.heightProportion()
    
    let toastLabel = UILabel(frame: CGRect(x: (Screen.width/2) - (toastWidth/2), y: Screen.height-120.heightProportion(), width: toastWidth, height: toastHeight))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = .white
    toastLabel.textAlignment = .center
    toastLabel.font = UIFont(name: Font.regular.rawValue, size: 12.heightProportion())
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    toastLabel.numberOfLines = 0
    toastLabel.adjustsFontSizeToFitWidth = true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
      toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
      toastLabel.removeFromSuperview()
    })
  }
  
//    Показать Alert
  func showAlert(title: String, text: String, action: @escaping (UIAlertAction) -> Void) {
    let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default ,handler: action))
    self.present(alertController, animated: true, completion: nil)
  }

//    Открыть Controller выборки фото
  func openImageController() {
    let ipVC = ImagePickerViewController()
    let navVC = UINavigationController(rootViewController: ipVC)
    navVC.navigationBar.barTintColor = .black
    navVC.navigationBar.tintColor = .white
    navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                               NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16.widthProportion())!]
    self.present(navVC, animated: true, completion: nil)
  }
  
//    Показать левое меню
  @objc func showMenuPanel() {
    panel?.openLeft(animated: true)
  }
  
}


extension NSMutableAttributedString {
  
//    делает ссылкой нужное слово в тексте
  public func setAsLink(textToFind: String, linkURL: String) -> Bool {
    
    let foundRange = self.mutableString.range(of: textToFind)
    if foundRange.location != NSNotFound {
      self.addAttribute(.link, value: linkURL, range: foundRange)
      self.addAttribute(.font, value: UIFont(name: Font.medium.rawValue, size: 11)!, range: foundRange)
      return true
    }
    return false
  }
}


extension UIView {
//    градиент для view
  func setGradientBackground(){
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.colors = [AppColor.blue.cgColor, AppColor.green.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    self.layer.insertSublayer(gradientLayer, at: 0)
    
  }
}

extension FAPanelController {
//    меняем центральный Controller
  func setCenter(isLoggedIn: Bool = false){
    if isLoggedIn {
      let leftMenuVC = MenuPanelViewController()
      let centerVC = ProfileViewController()
      let centerNavVC = UINavigationController(rootViewController: centerVC)
      centerNavVC.navigationBar.isTranslucent = false
      self.center(centerNavVC).left(leftMenuVC)
    } else {
      self.center(LoginViewController())
    }
}
}

