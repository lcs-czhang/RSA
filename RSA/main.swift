//
//  main.swift
//  RSA
//
//  Created by Yuzhou Zhang on 2024-09-19.
//

import Foundation


func getInput(
    withPrompt prompt: String,
    minimum: Int?,
    maximum: Int?
) -> Int {
    
    // Loop until a valid value is provided
    while true {
        
        // Prompt the user
        print(
            prompt
        )
        
        // Collect the input
        guard let givenInput = readLine() else {
            continue
        }
        
        // Convert to an integer
        guard let givenInteger = Int(
            givenInput
        ) else {
            continue
        }
        
        // If a lowest value for the integer was specified...
        if let minimumValue = minimum {
            
            // ... then check that the given integer is greater than or equal to the lowest desired value.
            guard givenInteger >= minimumValue else {
                continue
            }
            
        }
        
        // If an highest possible value for the integer was specified...
        if let maximumValue = maximum {
            
            // ... then check that the given integer is less than or equal to the highest desired value.
            guard givenInteger <= maximumValue else {
                continue
            }
            
            
        }
        
        // If we've made it past all the checks, the input is an integer in the desired range of values, so, return it
        return givenInteger
        
    }
    
}
var lowerLimit = getInput(withPrompt: "Enter the lower limit of range", minimum: 1, maximum: nil)
var upperLimit = getInput(withPrompt: "Enter the upper limit of range", minimum: 1, maximum: nil)

print("The number of RSA numbers between \(lowerLimit) and \(upperLimit) is \(findCountOfRSANumbers(between: lowerLimit, and: upperLimit))")

func findCountOfRSANumbers(between lower: Int, and upper: Int) -> Int {
    var numberOfRSA = 0
    // Loop over numbers in range
    for i in lower...upper {
        // Check whether current number is an RSA number
        
        if isRSA(number: i){
            numberOfRSA += 1
        }
        // Do something based on result...
    }
    // Return count of RSA numbers in the range given...
    return numberOfRSA
}

func isRSA(number: Int) -> Bool {
    // Loop over possible divisors
    var numberOfDivisor = 2
    var j = 2
    var jSquare = j*j
    while true{
        // Check whether current number is a divisor of this number
        jSquare = j*j
        if jSquare > number{
            return numberOfDivisor == 4
        } else if jSquare == number{
            return false
        }
        if isDivisor(dividend: number, divisor: j){
            numberOfDivisor += 2
        }
        j += 1
    }
    // Return whether this number is an RSA number...
}

func isDivisor(dividend: Int, divisor: Int) -> Bool {
    // Add logic to determine whether provided divisor actually
    // goes evenly into the provided dividend
    // (e.g.: remainder is zero)
    // Return the result...
    return dividend%divisor == 0
}
