//
//  MenuPanelViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/18/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy

class MenuPanelViewController: UIViewController {
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.backgroundColor = .white
    tv.separatorColor = .clear
    tv.isScrollEnabled = false
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.easy.layout(Edges(0), Top(50))
  }
  
}

extension MenuPanelViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    var title = ""
    var imageName = ""
    switch indexPath.row {
    case 0:
      imageName = "profile"
      title = "Profile"
    case 1:
      imageName = "history"
      title = "History"
    case 2:
      imageName = "instructions"
      title = "Instructions"
    case 3:
      imageName = "faq"
      title = "FAQ"
    case 4:
      imageName = "help_us"
      title = "Help us to develop"
    case 5:
      imageName = "edit"
      title = "Change info"
    default:
      break
    }
    cell.imageView?.image = UIImage(named: imageName)
    cell.textLabel?.text = title
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50.heightProportion()
  }
  
}


extension MenuPanelViewController: UITableViewDelegate{
  
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = MenuPanelHeaderView()
    headerView.easy.layout(Height(100.heightProportion()),Width(250.widthProportion()))
    headerView.easy.layout(Edges(0))
    headerView.nameLabel.text = "Adam Lambert"
    return headerView
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
    let navVC = UINavigationController()
    navVC.navigationBar.barTintColor = .white
    navVC.navigationBar.tintColor = .black
    navVC.navigationBar.isTranslucent = false
    switch indexPath.row {
    case 0:
      navVC.viewControllers = [ProfileViewController()]
    case 1:
      navVC.viewControllers = [ProfileViewController()]
    case 2:
      navVC.viewControllers = [ProfileViewController()]
    case 3:
      navVC.viewControllers = [ProfileViewController()]
    case 4:
      navVC.viewControllers = [ProfileViewController()]
    case 5:
      navVC.viewControllers = [ProfileViewController()]
    default:
      break
    }
    panel?.center(navVC)
    panel?.openCenter(animated: true)
  }
}
