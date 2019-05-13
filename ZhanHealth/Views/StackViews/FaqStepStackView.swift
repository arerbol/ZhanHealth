//
//  FaqStepStackView.swift
//  ZhanHealth
//
//  Created by Yerbol on 5/13/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy

class FaqStepStackView: UIStackView {
    
    lazy var stepLabel: UILabel = {
        let sl = UILabel()
        sl.font = UIFont(name: Font.medium.rawValue, size: 11.widthProportion())
        sl.textColor = .gray
        return sl
    }()
    
    lazy var commandLabel: UILabel = {
        let cl = UILabel()
        cl.font = UIFont(name: Font.medium.rawValue, size: 11.widthProportion())
        cl.numberOfLines = 0
        cl.textColor = .gray
        return cl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        stepLabel.easy.layout(Width(45.widthProportion()))
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        [stepLabel, commandLabel].forEach {
            self.addArrangedSubview($0)
        }
    }

}
