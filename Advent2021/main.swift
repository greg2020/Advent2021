//
//  main.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/1/21.
//

import Foundation

//try day1a()   // 1400
//try day1b()   // 1429
//try day1()
try day2()

// ----

func projectDir() -> String {
    let homeDirURL = URL(fileURLWithPath: NSHomeDirectory())
    return homeDirURL.appendingPathComponent("xcode-projects/Advent2021").path
}


func textToIntArray(data: String) -> [Int] {
    // enumerate all lines into Int array
    var nr = 0;
    var intArray:[Int] = []
    //var array:[String] = []//If your array is string type
    data.enumerateLines(invoking: { (line, stop) -> () in
        //print("Line = \(line)")
        let x = Int(line) ?? 0
        intArray.append(x)
        //print("nr \(nr) => \(x)")
        nr+=1;
    })
    
    //print("intArray \(intArray)")
    return intArray
}


// Some great file reading examples:
// https://stackoverflow.com/questions/24097826/read-and-write-a-string-from-text-file

func fileToString(filePath: String) throws -> String {
    let fileUrl = URL(fileURLWithPath: filePath);
    do {
        // Read the file contents
        let contents = try String(contentsOf: fileUrl)
        return contents
    } catch let error as NSError {
        print("Failed reading from URL: \(fileUrl), Error: " + error.localizedDescription)
        throw error
    }
}
