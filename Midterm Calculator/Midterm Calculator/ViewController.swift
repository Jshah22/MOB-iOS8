//
//  ViewController.swift
//  Midterm Calculator
//
//  Created by Jay Shah on 3/8/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var storedNumber: Double = 0.0
    var currentNumber: Double = 0.0
    var currentCalculation: Calculations = Calculations()
    var lastCalculation: Calculations = Calculations()
    var lastNumber: Double = 0.0
    var typeAfterDecimal: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultLabel.text = "0"
    }
    
    func resetLabel(){
//        self.currentNumber = 0.0
//        self.typeAfterDecimal = false
    }
    func clear() {
        resultLabel.text = "0"
    }
    func startOver() {
        clear()
        storedNumber = 0.0
        currentNumber = 0.0
        currentCalculation = Calculations()
        lastCalculation = Calculations()
        lastNumber = 0.0
    }
    
    @IBAction func allClear(sender: AnyObject) {
        let button = sender as! UIButton
        let amountToClear = button.titleLabel?.text
        if amountToClear == "AC" {
            resetLabel()
            startOver()
            button.setTitle("C", forState: .Normal)
                    }
        else if amountToClear == "C" {
            clear()
            button.setTitle("AC", forState: .Normal)
        }
        button.reloadInputViews()
        operatorBorder()
    }
    
    @IBAction func makeNegative(sender: AnyObject) {
        
        self.currentNumber = Double(self.resultLabel.text!)! * -1.0
        self.resultLabel.text = String(self.currentNumber)
        
        operatorBorder()
    }
    
    @IBAction func turnToPercent(sender: AnyObject) {
        
        self.currentNumber = Double(self.resultLabel.text!)! / 100.0
        self.resultLabel.text = String(currentNumber)
        
        operatorBorder()
    }
    
    @IBAction func showNumbers(sender: UIButton) {
        let number = sender.currentTitle
        if number == "." && resultLabel.text == "0" {
            resultLabel.text = "0."
        } else if resultLabel.text!.containsString(".") && number != "." {
            resultLabel.text = self.resultLabel.text! + number!
        } else if resultLabel.text == "0" {
            resultLabel.text = number
        } else {
            resultLabel.text = resultLabel.text! + number!
        }
        
        operatorBorder()
    }
    
    
    @IBAction func actionPressed(sender: UIButton) {
        if sender.tag == 0 {
            self.equalButton()
        }
        else if sender.tag == 1 {
            self.additionButton()
        }
        else if sender.tag == 2 {
            self.subtractionButton()
        }
        else if sender.tag == 3 {
            self.multiplicationButton()
        }
        else if sender.tag == 4 {
            self.divisionButton()
        }
    }
    
    func equalButton() {
        currentNumber = Double(resultLabel.text!)!
        if self.currentNumber != 0 {
            self.doMath()
            self.currentCalculation = Calculations()
        } else {
            self.storedNumber = self.lastCalculation.calculate(Double(self.resultLabel.text!)!, num2: self.lastNumber)
            self.resultLabel.text = String(self.storedNumber)
        }
        self.typeAfterDecimal = false
    }
    
    func doMath() {
        if self.currentCalculation is Multiplication {
            let storedCurrentNumber = self.currentNumber
            self.currentNumber = self.currentCalculation.calculate(self.lastNumber, num2: self.currentNumber)
            self.currentCalculation = self.lastCalculation
            self.doMath()
            self.lastCalculation = Multiplication()
            self.lastNumber = storedCurrentNumber
            
        }
        else if self.currentCalculation is Division {
            let storedCurrentNumber = self.currentNumber
            self.currentNumber = self.currentCalculation.calculate(self.lastNumber, num2: self.currentNumber)
            self.currentCalculation = self.lastCalculation
            self.doMath()
            self.lastCalculation = Division()
            self.lastNumber = storedCurrentNumber
            
        }
        else {
            self.storedNumber = self.currentCalculation.calculate(self.storedNumber, num2: self.currentNumber)
            self.resultLabel.text = String(self.storedNumber)
            self.lastCalculation = self.currentCalculation
            self.lastNumber = self.currentNumber
            
            resetLabel()
        }
    }
    
    func beforeAddSubtract() {
        if self.currentNumber != 0.0 {
            self.doMath()
        }
        resetLabel()
    }
    
    func beforeMultiplyDivide() {
        if self.currentNumber != 0.0 && self.currentCalculation is Multiplication {
            self.doMath()
        }
        else if self.currentNumber != 0.0 && self.currentCalculation is Division {
            self.doMath()
        }
        self.lastCalculation = self.currentCalculation
        self.lastNumber = Double(self.resultLabel.text!)!
    }
    
    func additionButton() {
        self.beforeAddSubtract()
        self.currentCalculation = Addition()
//        resultLabel.text = "0"
        clear()

    }
    
    func subtractionButton() {
        self.beforeAddSubtract()
        self.currentCalculation = Subtraction()
//        resultLabel.text = "0"
        clear()

    }
    
    func multiplicationButton() {
        self.beforeMultiplyDivide()
        self.currentCalculation = Multiplication()
        resetLabel()
        clear()
    }
    
    func divisionButton() {
        self.beforeMultiplyDivide()
        self.currentCalculation = Division()
        resetLabel()
        clear()
    }
    
    @IBOutlet var functionButton: [CalculatorButton]!
    
    func operatorBorder() {
        for i in 0..<functionButton.count{
            let button = functionButton[i]
            button.layer.borderWidth=1
        }
    }
    
    @IBAction func callFunction(sender:UIButton) {
        operatorBorder()
        sender.layer.borderWidth = 2.0
    }
    
}

