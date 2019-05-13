//
//  FAQViewController.swift
//  ZhanHealth
//
//  Created by Yerbol on 5/13/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy

class FAQViewController: UIViewController {
    
    lazy var mainView : FAQView = {
        let mv = FAQView()
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "FAQ", style: .plain, target: self, action: nil)]
        view.backgroundColor = AppColor.gray
        view.addSubview(mainView)
        mainView.easy.layout(Edges(10.widthProportion()))
    }

}
