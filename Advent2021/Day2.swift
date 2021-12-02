//
//  Day2.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/1/21.
//

import Foundation


func upp(s: String) -> String {
    return s.uppercased()
}

func day2() throws -> Void {
    print("day2")
    //try day2a()
    try day2b()

}
func day2b() throws -> Void {
    print("day2")
    
    let inputFilePath = projectDir() + "/"  + "day2_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    print(fileText)
    print("=======================")

    var aim = 0
    var x = 0
    var y = 0
    let arr:[String] = fileText
        .split(separator: "\n")
         .map(String.init)
        .map{ (line) -> String in
            
            let move = line.split(separator: " ")
            //print("\(move[0]) \(move[1])" )
            let v = Int(move[1]) ?? 0
            if move[0] == "forward" {
                x += v
                y += (aim * v)
            } else if move[0] == "up" {
                aim -= v
            } else if move[0] == "down" {
                aim += v
            } else {
                print("UNKNOWN MOVE \(line)")
            }
            return (" **>" + line + "<** ")
        }
    
    print("moves = arr.count = \(arr.count)")
    print("x = \(x)")
    print("x = \(y)")
    print("x*y = \(x*y)")
    
}


func day2a() throws -> Void {
    print("day2")
    
    let inputFilePath = projectDir() + "/"  + "day2_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    print(fileText)
    print("=======================")

    var x = 0
    var y = 0
    let arr:[String] = fileText
        .split(separator: "\n")
         .map(String.init)
        .map{ (line) -> String in
            
            let move = line.split(separator: " ")
            print("move[0] = [\(move[0])] move[0] = [\(move[1])]" )
            let v = Int(move[1]) ?? 0
            if move[0] == "forward" {
                x += v
            } else if move[0] == "up" {
                y -= v
            } else if move[0] == "down" {
                y += v
            } else {
                print("UNKNOWN MOVE \(line)")
            }
            return (" **>" + line + "<** ")
        }
    
    print("arr = \(arr)")
    print("x = \(x)")
    print("x = \(y)")
    print("x*y = \(x*y)")
    
//
//    let stream = StreamScanner(source: FileHandle(forReadingAtPath: inputFilePath)!,
//                               delimiters: CharacterSet(charactersIn: " \n"))
//
//        while let field: String = stream.read()
//        {
//            //use field
//            print("field = [\(field)]")
//        }
    
}
