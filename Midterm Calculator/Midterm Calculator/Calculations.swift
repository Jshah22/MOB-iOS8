//
//  Calculations.swift
//  Midterm Calculator
//
//  Created by Jay Shah on 3/15/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import Foundation

class Calculations {
    func calculate(num1: Double, num2: Double) -> Double {
        return num2
    }
}

class Addition: Calculations {
    override init() {
        super.init()
    }
    override func calculate(num1: Double, num2: Double) -> Double {
        return num1+num2
    }
}

class Subtraction: Calculations {
    override init() {
        super.init()
    }
    override func calculate(num1: Double, num2: Double) -> Double {
        return num1-num2
    }
}

class Multiplication: Calculations {
    override init() {
        super.init()
    }
    override func calculate(num1: Double, num2: Double) -> Double {
        return num1*num2
    }
}

class Division: Calculations {
    override init() {
        super.init()
    }
    override func calculate(num1: Double, num2: Double) -> Double {
        return num1/num2
    }
}


