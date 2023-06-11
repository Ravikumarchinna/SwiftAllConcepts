//
//  SwiftBasics.swift
//  SwiftAllConcepts
//
//  Created by Apple on 11/06/23.
//

import Foundation

import UIKit

// var greeting = "Hello, playground"


//for i in 0..<5
//{
//    for j in 0..<i
//    {
//        print("*" , terminator: "")
//    }
//    print("")
//}
    
//... Higher Orderd functons

var numArray = [1,2,4,22,10,34,73,36]
//var ascendinfList = numArray.sorted()
//var descendinfList = numArray.sorted(by: >)
////print(ascendinfList)
////print(descendinfList)
//
//var evenList = numArray.sorted {(a,b)-> Bool in
//
//    return a % 2 == 0
//}
// print("even list \(evenList)")
// numArray.sort()

//var listnum = numArray.map { a in
//    return "\(a)"
//}
//print(listnum)

//let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]
//let allMarks = marks.flatMap { $0.filter{$0>3 && ($0 % 2) == 0}
//
//}
//print(allMarks)


//...Reduce

var sumall = numArray.reduce(0) { partialResult, a in
    
    return partialResult + a
}






































