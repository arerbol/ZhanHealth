//
//  ProfileViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/19/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Profile", style: .plain, target: self, action: nil)]
  }
  
}
