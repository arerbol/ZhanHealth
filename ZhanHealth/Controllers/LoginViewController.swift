//
//  LoginViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/17/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  lazy var mainView: LoginView = {
    let mv = LoginView()
    mv.signUpTextView.delegate = self
    mv.termsAndPolicy.delegate = self
    mv.signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
//    добавляем наш Extension
    self.hideKeyboardWhenTappedAround()
  }
  
//    вход, проверка в базе
  @objc func signIn() {
    let conn = Connection()
    if validate() {
      let loggedIn = conn.logIn(email: mainView.emailField.text!, password: mainView.passwordField.text!)
      if loggedIn {
        enterToApp()
      } else {
        self.showToast(message: "login or password are incorrect")
      }
    }
  }
  
//  вход в приложение, ставим центр, и открываем его
  func enterToApp() {
    panel?.setCenter(isLoggedIn: true)
    panel?.openCenter(animated: true)
  }
  
// валидация данных
  func validate() -> Bool {
    if mainView.emailField.text == nil || mainView.emailField.text == "" {
      mainView.emailField.errorMessage = "Enter email"
      return false
    }
    if mainView.passwordField.text == nil || mainView.passwordField.text == "" {
      mainView.passwordField.errorMessage = "Enter password"
      return false
    }
    return true
  }
  
}

extension LoginViewController: UITextViewDelegate {
  
//    Ссылочные слова, ловим их при нажатии и делаем нужное действие
  @available(iOS 10.0, *)
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    switch URL.absoluteString {
    case "signUp":
      let nextVC = SignUpViewController()
      self.present(nextVC, animated: true, completion: nil)
    case "TermsofService":
      print("2")
    case "PrivacyPolicy":
      print("3")
    default:
      break
    }
    return true
  }
}
