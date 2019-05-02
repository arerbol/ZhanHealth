//
//  Contact.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/16/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
  @objc dynamic var name: String? = nil
  @objc dynamic var phone: String? = nil
  @objc dynamic var owner: User?
}
