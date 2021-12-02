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
    
    let inputFilePath = projectDir() + "/"  + "day2_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    print(fileText)
    print("=======================")

    let arr:[String] = fileText
        .split(separator: "\n")
         .map(String.init)
    .map{ (name) -> String in
            return (" **>" + name.capitalized + "<** ")
        }
        
    
    print("arr = \(arr)")
    
    let stream = StreamScanner(source: FileHandle(forReadingAtPath: inputFilePath)!,
                               delimiters: CharacterSet(charactersIn: "-.:\n"))

        while let field: String = stream.read()
        {
            //use field
            print("field = [\(field)]")
        }
    
}
