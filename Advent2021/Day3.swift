//
//  Day3.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/2/21.
//

import Foundation

func day3() throws -> Void {
    print("day3")
    try day3a()
    //try day3b()

}
func day3b() throws -> Void {
    print("day3b")
}
func day3a() throws -> Void {
    print("day3a")
    let inputFilePath = projectDir() + "/"  + "day3_input_q.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    print("=== input file text ===")
    print(fileText)
    print("=======================")
}
