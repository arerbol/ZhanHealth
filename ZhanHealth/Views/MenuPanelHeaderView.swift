//
//  MenuPanelHeaderView.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/18/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy

class MenuPanelHeaderView: UIView {
 
  lazy var imageButton: UIButton = {
    let btn = UIButton()
    btn.imageView?.contentMode = .scaleAspectFill
    btn.layer.cornerRadius = 10
    btn.layer.masksToBounds = true
    return btn
  }()
  
  lazy var nameLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont(name: Font.medium.rawValue, size: 14.widthProportion())
    l.numberOfLines = 0
    return l
  }()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupViews()
    setupConstraints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [imageButton, nameLabel].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    imageButton.easy.layout(Left(10.widthProportion()),
                            CenterY(0),
                            Width(80.widthProportion()),
                            Height(70.heightProportion()))
    nameLabel.easy.layout(CenterY(0).to(imageButton),
                          Left(10.widthProportion()).to(imageButton),
                          Right(5.widthProportion()))
  }
}
