//
//  CalculatorButton.swift
//  Midterm Calculator
//
//  Created by Jay Shah on 3/8/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

@IBDesignable class CalculatorButton: UIButton {

    @IBInspectable var borderColor:UIColor = UIColor.blackColor()
    @IBInspectable var borderWidth:CGFloat = CGFloat(1.0)
    override func drawRect(rect: CGRect) {
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = 1.0
    }

}
