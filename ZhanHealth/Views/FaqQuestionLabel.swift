//
//  FaqQuestionLabel.swift
//  ZhanHealth
//
//  Created by Yerbol on 5/13/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit

class FaqQuestionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont(name: Font.semiBold.rawValue, size: 11.widthProportion())
        self.numberOfLines = 0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
