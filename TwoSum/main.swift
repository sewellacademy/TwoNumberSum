//
//  main.swift
//  TwoSum
//
//  Created by Dylan Sewell on 1/17/22.
//

import Foundation

class ProgramNested {
    // O(n^2) time | O(1) space
    func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        for i in 0..<array.count - 1 {
            let firstNumber = array[i]
            
            for j in i..<array.count {
                let secondNumber = array[j]
                
                if firstNumber + secondNumber == targetSum {
                    return [firstNumber, secondNumber]
                }
            }
        }
        return []
    }
    
}

class ProgramHashMap {
    // O(n) time | O(n) space
    func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        
        var numbersHashMap = [Int: Bool]()
        for number in array {
            let potentialMatch = targetSum - number
            
            if let exists = numbersHashMap[potentialMatch], exists {
                return [potentialMatch, number]
            } else {
                numbersHashMap[number] = true
            }
        }
        return []
    }
}

class ProgramLeftRight {
    // O(nlog(n)) time | O(1) space
    func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        array.sort()
        
        var leftPointer = 0
        var rightPointer = array.count - 1
                
        while leftPointer < rightPointer {
            let leftMost = array[leftPointer]
            let rightMost = array[rightPointer]
            
            let currentSum = leftMost + rightMost
            
            if currentSum == targetSum {
                return [leftMost, rightMost]
            } else if currentSum < targetSum {
                leftPointer = leftPointer + 1
            } else if currentSum > targetSum {
                rightPointer = rightPointer - 1
            }
        }
        return []
    }
}

var arr: [Int] = [3, 5, -4, 8, 11, 1, 1, 6]
let targetSum = 13

var resultsNested = ProgramNested().twoNumberSum(&arr, targetSum)
print("nested: \(resultsNested)")

var resultsHashMap = ProgramHashMap().twoNumberSum(&arr, targetSum)
print("hashmap: \(resultsHashMap)")

var resultsPointers = ProgramLeftRight().twoNumberSum(&arr, targetSum)
print("pointers: \(resultsPointers)")
