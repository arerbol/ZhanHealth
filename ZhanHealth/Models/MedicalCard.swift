//
//  MedicalCard.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/16/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation
import RealmSwift

class MedicalCard: Object {
  @objc dynamic var dob: String? = nil
  @objc dynamic var diseases: String? = nil
  @objc dynamic var bloodType: String? = nil
  @objc dynamic var rhesusFactor: String? = nil
  @objc dynamic var owner: User?
}
