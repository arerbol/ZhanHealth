//
//  Instruction.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/16/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation
import RealmSwift

class Instruction: Object {
  @objc dynamic var problem: String? = nil
  @objc dynamic var solution: String? = nil
  @objc dynamic var owner: User?
}
