//
//  AnswerButton.swift
//  Destini-iOS13
//
//  Created by Macbook on 24.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
   
    
    override func layoutSubviews() {
            super.layoutSubviews()
            configure()
        }
    
    private func configure() {
        layer.cornerRadius = bounds.height/2
        clipsToBounds = true
    }
}
