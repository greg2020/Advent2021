//
//  Day3.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/2/21.
//

import Foundation

func day3() throws -> Void {
    print("day3")
    //try day3a()
    try day3b()

}
func day3b() throws -> Void {
    print("day3b")
    //let inputFilePath = projectDir() + "/"  + "day3_input_q.txt"
    let inputFilePath = projectDir() + "/"  + "day3_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    print(fileText)
    print("=======================")
    let arr:[String] = fileText
        .split(separator: "\n")
         .map(String.init)
//        .map{ (line) -> String in
//            return line
//        }
    
    //print("start arr: \(arr)")
   
    //let bitLen = 5
    let bitLen = 12
    
    let oxy = findOxy(bitLen: bitLen, bitPos: 0, arr:arr)
    let ogr = Int(oxy, radix: 2) ?? 0
    print("oxy = \(oxy) ogr = \(ogr)")

    let co2s = findCo2(bitLen: bitLen, bitPos: 0, arr:arr)
    let co2r = Int(co2s, radix: 2) ?? 0
    print("co2s = \(co2s) co2r = \(co2r)")
    
    // life support rating
    let lsr = ogr * co2r
    print ("lsr = \(lsr)")

}

// CO2 scrubber rating
func findCo2(bitLen: Int, bitPos: Int, arr: [String]) -> String {
    //print("Finding CO2 scrubber rating for bit pos \(bitPos) arr: \(arr)")
    if arr.count == 1 {
        return arr[0]
    }
    // else
    
    let (ones, zeros) = countOnesAndZeros(size: bitLen, arr: arr)

    var keep: [String] = []
    for i in 0 ..< arr.count {
        let line = arr[i]
        let index = indexAtBitPos(n: bitPos, str: line)
        if zeros[bitPos] <= ones[bitPos] {
            // least common val for this bit position == "0"
            if line[index] == "0" {
                keep.append(arr[i])
            }
        } else {
            // least common val for this bit position == "1"
            if line[index] == "1" {
                keep.append(arr[i])
            }
        }
    }
    return findCo2(bitLen: bitLen, bitPos: bitPos+1, arr: keep)
}


// oxygen generator rating
func findOxy(bitLen: Int, bitPos: Int, arr: [String]) -> String {
    //print("Finding oxygen generator rating for bit pos \(bitPos) arr: \(arr)")
    if arr.count == 1 {
        return arr[0]
    }
    // else
    
    let (ones, zeros) = countOnesAndZeros(size: bitLen, arr: arr)
//    print("ones = \(ones)")
//    print("zeros = \(zeros)")

    var keep: [String] = []
    for i in 0 ..< arr.count {
        let line = arr[i]
        let index = indexAtBitPos(n: bitPos, str: line)
        if ones[bitPos] >= zeros[bitPos] {
            // most common val for this bit position == "1"
            if line[index] == "1" {
                keep.append(arr[i])
            }
        } else {
            // most common val for this bit position == "0"
            if line[index] == "0" {
                keep.append(arr[i])
            }
        }
    }
    return findOxy(bitLen: bitLen, bitPos: bitPos+1, arr: keep)
}

func indexAtBitPos(n: Int, str: String) -> String.Index {
    var currIndex = str.startIndex
    for _ in 0 ..< n {
        currIndex = str.index(after: currIndex)
    }
    return currIndex
}


func countOnesAndZeros(size: Int, arr: [String]) -> ([Int],[Int]){
    var ones = Array(repeating: 0, count: size)
    var zeros = Array(repeating: 0, count: size)
    for line in arr {
        //print("Line = \(line)")
        var currIndex = line.startIndex
        for i in 0 ..< line.count {
            if line[currIndex] == "1" {
                ones[i] += 1
            } else {
                zeros[i] += 1
            }
            currIndex = line.index(after: currIndex)
        }
    }
    
    return (ones, zeros)
}

// =========================================
func day3a() throws -> Void {
    print("day3a")
    let inputFilePath = projectDir() + "/"  + "day3_input_q.txt"
    //let inputFilePath = projectDir() + "/"  + "day3_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    //print(fileText)
    print("=======================")

    //111001010010

//    for character in line {
//        print(character)
//    }
    
    //var ones: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0]
    //var zeros: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0]
    
    var ones = Array(repeating: 0, count: 5)
    var zeros = Array(repeating: 0, count: 5)
//
//    var ones = Array(repeating: 0, count: 12)
//    var zeros = Array(repeating: 0, count: 12)

    fileText.enumerateLines(invoking: { (line, stop) -> () in
        //print("Line = \(line)")
        var currIndex = line.startIndex
        for i in 0 ..< line.count {
            if line[currIndex] == "1" {
                ones[i] += 1
            } else {
                zeros[i] += 1
            }
            currIndex = line.index(after: currIndex)
        }

    })
    print("ones = \(ones)")
    print("zeros = \(zeros)")
    
    var gamma = ""
    var epsilon = ""
    let zero: Character = "0"
    let one: Character = "1"
    
    for i in 0 ..< ones.count {
        if ones[i] > zeros[i] {
            gamma.append(one)
            epsilon.append(zero)
        } else {
            gamma.append(zero)
            epsilon.append(one)
        }
    }
    let gammaRate = Int(gamma, radix: 2) ?? 0
    let epsilonRate = Int(epsilon, radix: 2) ?? 0
    
    print("gamma   = \(gamma) => \(gammaRate)")
    print("epsilon = \(epsilon) => \(epsilonRate)")
    print("powerConsumption = \(gammaRate * epsilonRate)")

}

