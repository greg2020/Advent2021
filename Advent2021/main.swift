//
//  main.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/1/21.
//

import Foundation

try day0()
//try day1()
// ----
func day1() throws -> Void {
    print("day1")
}

func day0() throws -> Void {
    print("day0")
    
    let filePath = "/Users/trpht39/xcode-projects/Advent2021/day0_input.txt"
    let fileUrl = URL(fileURLWithPath: filePath);

    let contents = try String(contentsOf: fileUrl, encoding: .utf8)
    
    // enumerate all lines into int array
    var nr = 0;
    var depths:[Int] = []
    //var array:[String] = []//If your array is string type
    contents.enumerateLines(invoking: { (line, stop) -> () in
        //print("Line = \(line)")
        let x = Int(line) ?? 0
        depths.append(x)
        //print("nr \(nr) => \(x)")
        nr+=1;
    })
    
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
}

