

import Foundation


struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediteCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
                
            } else if symbol == "AC" {
                return 0
                
            } else if symbol == "%" {
                return n * 0.01
                
            } else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
                
            } else {
                intermediteCalculation = (n1: n, calcMethod: symbol)
                
            }
            
            
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediteCalculation?.n1, let operation = intermediteCalculation?.calcMethod {
            if operation == "+" {
                return n1 + n2
            } else if operation == "x" {
                return n1 * n2
            } else if operation == "-" {
                return n1 - n2
            } else if operation == "÷" {
                return n1 / n2
            } else {
                fatalError("Operation does not eexist!")
            }
        }
        return nil
    }
    
}
