//
//  Day1.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/1/21.
//

import Foundation

func day1() throws -> Void {
    print("day1")
    let inputFilePath = projectDir() + "/"  + "day1_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    //print("fileText = \(fileText)")
    let largerThanPrevCount = day1_a(data: fileText)
    let largerThanPrevWindow = day1_b(data: fileText)
    print("day1_a largerThanPrevCount = \(largerThanPrevCount)")
    print("day1_b largerThanPrevWindow = \(largerThanPrevWindow)")
}
func day1_b(data: String) -> Int {
    
    let depths = textToIntArray(data: data)
    
    var previousWin = 0
    var largerThanPrevCount = 0
    for i in 0 ..< depths.count-2 {
        var currWin = 0
        for j in i ..< i+3 {
            currWin += depths[j]
        }
        if i == 0 {
            print("ABC winstart[\(i)] currWin [\(currWin)]: (N/A - no previous sum)")
        } else if currWin > previousWin {
            print("ABC winstart[\(i)] currWin [\(currWin)]: increased")
            largerThanPrevCount += 1
        } else if currWin < previousWin {
            print("ABC winstart[\(i)] currWin [\(currWin)]: decreased")
        } else {
            print("ABC winstart[\(i)] currWin [\(currWin)]: (no change)")
        }
        previousWin = currWin
    }
    //print("largerThanPrevCount \(largerThanPrevCount)")
    return largerThanPrevCount
}


func day1_a(data: String) -> Int {

    let depths = textToIntArray(data: data)
    print("depths \(depths)")
    
    var previous = depths[0]
    var largerThanPrevCount = 0
    for i in 1 ..< depths.count {
        if previous < depths[i] {
            print("depth [\(i)]: \(depths[i]) (increased)")
            largerThanPrevCount += 1
        } else if previous > depths[i] {
            print("depth [\(i)]: \(depths[i]) decreased")
        } else {
            print("depth [\(i)]: \(depths[i]) <no change>")
        }
        
        previous = depths[i]
    }
    print("largerThanPrevCount \(largerThanPrevCount)")
    return largerThanPrevCount
}
