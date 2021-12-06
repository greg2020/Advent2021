//
//  Day4.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/5/21.
//

import Foundation


let bnumbers = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
//let bnumbers = [87,12,53,23,31,70,37,79,95,16,72,9,98,92,5,74,17,60,96,80,75,11,73,33,3,84,81,2,97,93,59,13,77,52,69,83,51,64,48,82,7,49,20,8,36,66,19,0,99,41,91,78,42,40,62,63,57,39,55,47,29,50,58,34,27,43,30,35,22,28,4,14,26,32,10,88,46,65,90,76,38,6,71,67,44,68,86,25,21,24,56,94,18,89,61,15,1,45,54,85]

var bboards:[Matrix<Int>] = []

func day4a() throws -> Void {
    print("day4a")
    
    let inputFilePath = projectDir() + "/"  + "day4_input_q.txt"
    //let inputFilePath = projectDir() + "/"  + "day4_input.txt"
    print("inputFilePath = \(inputFilePath)")
    let fileText = try fileToString(filePath: inputFilePath)
    
        
    print("=== input file text ===")
    //print(fileText)
    print("=======================")
    
    let arr:[String] = fileText
        .split(separator: "\n")
         .map(String.init)

    //var boards: [[Int]] = []
    
    var b = 0
    for _ in 0 ..< arr.count / 5 {
        var board:Matrix<Int> = Matrix(rows: 5, columns: 5,defaultValue:0)
        for j in 0 ..< 5 {
          //print("i=\(i) = \(arr[i])")
          let row:[Int] = arr[b+j]
            .split(separator: " ")
             .map(String.init)
            .map{ (nr) -> Int in
                let n = Int(nr) ?? 0
                return n
            }
          //print("row= \(row)")
          //boards.append(row)
            for n in 0..<row.count {
                board[j,n] = row[n]
            }
        }
        bboards.append(board)
        //print("\(board)")
        b += 5
    }
    //print("\(boards)")
    
   
    for n in 0..<bnumbers.count {
        //find n in each board
        print("===> finding n in boards: \(bnumbers[n])")
        if updateAllBingoBoards(n: n) {
            print("***** winner on \(bnumbers[n]) \n")
            break
        }

    }
    //print("==== \(boards)")

}

func updateAllBingoBoards(n: Int) -> Bool {
    for b in 0..<bboards.count {
        //print("board: \(board)")
        for row in 0..<5 {
            for col in 0..<5 {
                if bboards[b][row,col] == bnumbers[n] {
                    bboards[b][row,col] = -1
                    if doWeHaveABoardWinner(n: bnumbers[n]) {
                        print("** winner on board \(b) n = \(bnumbers[n])")
                        return true
                    }
                }
            }
        }
    }
    // no winner yet
    return false
}

func doWeHaveABoardWinner(n: Int) -> Bool {
    if doWeHaveAColBoardWinner(n:n) {
        print ("col winner at n: \(n)")
        return true
    }
    if doWeHaveARowBoardWinner(n:n) {
        print ("row winner at n: \(n)")
        return true
    }
    return false
}

func calcBoardScore(board: Int, n: Int) {
    var sum = 0
    for row in 0..<5 {
        for col in 0..<5 {
            if bboards[board][row,col] != -1 {
                sum += bboards[board][row,col]
            }
        }
    }
    print("sum = \(sum)")
    print("score = n * sum = \(n) * \(sum) = \(n*sum)")

}

func doWeHaveAColBoardWinner(n: Int) -> Bool {
    for b in 0..<bboards.count {
        //print("board: \(board)")
        for col in 0..<5 {
            if bboards[b][0,col] == -1 &&
                bboards[b][1,col] == -1 &&
                bboards[b][2,col] == -1 &&
                bboards[b][3,col] == -1 &&
                bboards[b][4,col] == -1 {
                print("row winner on board: \(b)")
                calcBoardScore(board: b,n: n)
                return true
            }
        }
    }
    // no winner
    return false
}
func doWeHaveARowBoardWinner(n: Int) -> Bool {
    for b in 0..<bboards.count {
        //print("board: \(board)")
        for row in 0..<5 {
            if bboards[b][row,0] == -1 &&
                bboards[b][row,1] == -1 &&
                bboards[b][row,2] == -1 &&
                bboards[b][row,3] == -1 &&
                bboards[b][row,4] == -1 {
                print("row winner on board: \(b)")
                calcBoardScore(board: b,n: n)
                return true
            }
        }
    }
    // no winner
    return false
}


struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    init(rows: Int, columns: Int,defaultValue: T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultValue, count: rows * columns) as! [T]
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}



