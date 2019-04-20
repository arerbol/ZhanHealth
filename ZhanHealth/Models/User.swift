//
//  User.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/16/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
  @objc dynamic var firstname: String? = nil
  @objc dynamic var lastname: String? = nil
  @objc dynamic var email: String? = nil
  @objc dynamic var password: String? = nil
  let medicalCard = MedicalCard()
  let contacts = List<Contact>()
  let instructions = List<Instruction>()
}
