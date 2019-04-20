//
//  SignUpViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/17/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  lazy var mainView: SignUpView = {
    let mv = SignUpView()
    mv.signInTextView.delegate = self
    mv.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    self.hideKeyboardWhenTappedAround()
  }
  
  @objc func signUp() {
    let conn = Connection()
    if validate() {
      let reg = conn.register(firstname: mainView.firstNameField.text!,
                                 lastname: mainView.lastNameField.text!,
                                 email: mainView.emailField.text!,
                                 password: mainView.passwordField.text!)
      if reg {
        self.showAlert(title: "Success", text: "You are succesfully registered", action: {_ in
          self.dismiss(animated: true, completion: nil)
        })
      } else {
          showToast(message: "Account already exists")
      }
    }
    }
  
  func validate() -> Bool {
    if mainView.firstNameField.text == nil || mainView.firstNameField.text == "" {
      mainView.firstNameField.errorMessage = "Enter Firstname"
      return false
    }
    if mainView.lastNameField.text == nil || mainView.lastNameField.text == "" {
      mainView.lastNameField.errorMessage = "Enter Lastname"
      return false
    }
    if mainView.emailField.text == nil || mainView.emailField.text == "" {
      mainView.emailField.errorMessage = "Enter Email"
      return false
    }
    if mainView.passwordField.text == nil || mainView.passwordField.text == "" {
      mainView.passwordField.errorMessage = "Enter Password"
      return false
    }
    if mainView.confirmPasswordField.text == nil || mainView.confirmPasswordField.text == "" {
      mainView.confirmPasswordField.errorMessage = "Confirm Password"
      return false
    }
    if mainView.passwordField.text != mainView.confirmPasswordField.text {
      mainView.passwordField.errorMessage = "Passwords don't match"
      mainView.confirmPasswordField.errorMessage = "Passwords don't match"
      return false
    }
    return true
  }
}


extension SignUpViewController: UITextViewDelegate {
  
  @available(iOS 10.0, *)
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    self.dismiss(animated: true, completion: nil)
    return true
  }
}
