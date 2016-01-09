//: Playground - noun: a place where people can play

import UIKit

// Exercise 1

func isEven(num:Int) -> Bool {
    
    var isBool:Bool!
    let evenArray:[String] = ["0", "2", "4", "6", "8"]
    var numStr = num.description
    var myWord = ""

    for item in evenArray {
                
        if ( numStr.hasSuffix(item) ) {
            
            isBool = true

            myWord = "It's an even number"
            
        } else  {
            
            isBool = false
            
            myWord = "It's an odd number"
            
        }
   
    }
    
    print(isBool)
    print(myWord)
    
    return isBool
    
}

isEven(20198999)


// Exercise 2

var oddNumbers = [Int]()
var sums = [Int]()

for var i = 1; i <= 100; i++ {
    
    oddNumbers.append(i)
    
}

for item in oddNumbers {
    
    var ref = 0
    
    ref = item
    
    ref += 5
    
    sums.append(ref)
    
}
print(sums)


var x = 0
var i = 0

//print("The sum is \(sums[x])")

repeat {
    
    i += sums[x]
    x++
    
   
} while x < 100
print("The sum is: \(sums[i])")




















