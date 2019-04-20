//
//  Connection.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/18/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation
import RealmSwift

class Connection {
  
  fileprivate let realm = try! Realm()
  fileprivate let passwordKey = "userPassword"
  fileprivate let loginKey = "userLogin"

  func register(firstname: String, lastname: String, email: String, password: String) -> Bool {
    let foundUser = realm.objects(User.self).filter("email='\(email)' AND password='\(password)'").first
    if let _ = foundUser {
      return false
    }
    
    let user = User()
    user.firstname = firstname
    user.lastname = lastname
    user.email = email
    user.password = password
    try! realm.write {
      realm.add(user)
    }
    return true
  }
  
  func isLoggedIn() -> Bool {
    if let _ = getAppUser() {
      return true
    }
    return false
  }
  
  func logIn(email: String, password: String) -> Bool {
    let user = realm.objects(User.self).filter("email='\(email)' AND password='\(password)'").first
    if let foundUser = user {
      let appUser = getAppUser()
      if appUser == nil || appUser != foundUser {
        saveAppUser(user: foundUser)
      }
      return true
    }
    return false
  }
  
  func logOut() {
    UserDefaults.standard.removeObject(forKey: loginKey)
    UserDefaults.standard.removeObject(forKey: passwordKey)
    UserDefaults.standard.synchronize()
  }
  
  func saveAppUser(user: User) {
    UserDefaults.standard.set(user.email!, forKey: loginKey)
    UserDefaults.standard.set(user.password!, forKey: passwordKey)
    UserDefaults.standard.synchronize()
  }
  
  func getAppUser() -> User? {
    if let login = UserDefaults.standard.value(forKey: loginKey),
      let password = UserDefaults.standard.value(forKey: passwordKey) {
      let user = realm.objects(User.self).filter("email='\(login)' AND password='\(password)'").first
      return user
    }
    return nil
  }
  
}
