//
//  FAQView.swift
//  ZhanHealth
//
//  Created by Yerbol on 5/13/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import UIKit
import EasyPeasy

class FAQView: UIView {
    
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "FREQUENTLY ASKED QUESTIONS:"
        tl.font = UIFont(name: Font.medium.rawValue, size: 16.widthProportion())
        tl.textAlignment = .center
        return tl
    }()
    
    lazy var questionLabel1: FaqQuestionLabel = {
        let ql = FaqQuestionLabel()
        ql.text = "1. How to activate the widget?"
        return ql
    }()
    
    lazy var question1Step1: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 1"
        sl.commandLabel.text = "Swipe the screen to the left"
        return sl
    }()
    
    lazy var question1Step2: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 2"
        sl.commandLabel.text = "Click on the [Edit] button and add the widget using the plus sign [+]"
        return sl
    }()
    
    lazy var questionLabel2: FaqQuestionLabel = {
        let ql = FaqQuestionLabel()
        ql.text = "2. How does sending messages to your doctor feature works?"
        return ql
    }()
    
    lazy var question2Step1: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 1"
        sl.commandLabel.text = "Create chat in Telegram"
        return sl
    }()
    
    lazy var question2Step2: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 2"
        sl.commandLabel.text = "Add needed members"
        return sl
    }()
    
    lazy var question2Step3: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 3"
        sl.commandLabel.text = "The next time you press the 🆘 button, the geolocation and medical data are automatically sent to this chat"
        return sl
    }()
    
    lazy var questionLabel3: FaqQuestionLabel = {
        let ql = FaqQuestionLabel()
        ql.text = "3. How to call Emergency Contact?"
        return ql
    }()
    
    lazy var question3Step1: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 1"
        sl.commandLabel.text = "Click on the contacts tab"
        return sl
    }()
    
    lazy var question3Step2: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 2"
        sl.commandLabel.text = "Confirm and click on the [call] button"
        return sl
    }()
    
    lazy var questionLabel4: FaqQuestionLabel = {
        let ql = FaqQuestionLabel()
        ql.text = "4. How to delete information in the medical card?"
        return ql
    }()
    
    lazy var question4Step1: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 1"
        sl.commandLabel.text = "Swipe left"
        return sl
    }()
    
    lazy var question4Step2: FaqStepStackView = {
        let sl = FaqStepStackView()
        sl.stepLabel.text = "STEP 2"
        sl.commandLabel.text = "Press the red button [delete]"
        return sl
    }()
    
    
    lazy var contactLabel: UILabel = {
        let cl = UILabel()
        cl.text = "For further suggestion please contact us:  test@mail.ru"
        cl.font = UIFont(name: Font.medium.rawValue, size: 14.widthProportion())
        cl.textAlignment = .center
        cl.numberOfLines = 0
        return cl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        [titleLabel, questionLabel1, question1Step1, question1Step2,
            questionLabel2, question2Step1, question2Step2, question2Step3,
            questionLabel3, question3Step1, question3Step2,
            questionLabel4, question4Step1, question4Step2,
            contactLabel].forEach {
            self.addSubview($0)
        }
    }
    
    fileprivate func setupConstraints() {
        titleLabel.easy.layout(Top(15.heightProportion()),
                               CenterX(0))
        questionLabel1.easy.layout(Top(20.heightProportion()).to(titleLabel),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question1Step1.easy.layout(Top(15.heightProportion()).to(questionLabel1),
                                Left(20.widthProportion()),
                                Right(20.widthProportion()))
        question1Step2.easy.layout(Top(15.heightProportion()).to(question1Step1),
                                Left(20.widthProportion()),
                                Right(20.widthProportion()))
        questionLabel2.easy.layout(Top(20.heightProportion()).to(question1Step2),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question2Step1.easy.layout(Top(15.heightProportion()).to(questionLabel2),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question2Step2.easy.layout(Top(15.heightProportion()).to(question2Step1),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question2Step3.easy.layout(Top(15.heightProportion()).to(question2Step2),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        questionLabel3.easy.layout(Top(20.heightProportion()).to(question2Step3),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question3Step1.easy.layout(Top(15.heightProportion()).to(questionLabel3),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question3Step2.easy.layout(Top(15.heightProportion()).to(question3Step1),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        questionLabel4.easy.layout(Top(20.heightProportion()).to(question3Step2),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question4Step1.easy.layout(Top(15.heightProportion()).to(questionLabel4),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        question4Step2.easy.layout(Top(15.heightProportion()).to(question4Step1),
                                   Left(20.widthProportion()),
                                   Right(20.widthProportion()))
        contactLabel.easy.layout(Top(15.heightProportion()).to(question4Step2),
                                 Left(20.widthProportion()),
                                 Right(20.widthProportion()))
    }
}
