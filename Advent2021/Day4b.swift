//
//  Day4.swift
//  Advent2021
//
//  Created by Williams, Greg on 12/5/21.
//

import Foundation


let numbers = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
//let numbers = [87,12,53,23,31,70,37,79,95,16,72,9,98,92,5,74,17,60,96,80,75,11,73,33,3,84,81,2,97,93,59,13,77,52,69,83,51,64,48,82,7,49,20,8,36,66,19,0,99,41,91,78,42,40,62,63,57,39,55,47,29,50,58,34,27,43,30,35,22,28,4,14,26,32,10,88,46,65,90,76,38,6,71,67,44,68,86,25,21,24,56,94,18,89,61,15,1,45,54,85]

var boards:[Matrix<Int>] = []

var boardWinCount = Set<Int>()

func day4b() throws -> Void {
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
    for i in 0 ..< arr.count / 5 {
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
        boards.append(board)
        boardWinCount.insert(i)
        //print("\(board)")
        b += 5
    }
    //print("\(boards)")
    
    print("boardWinCount = \(boardWinCount)")
    
    for n in 0..<numbers.count {
        //find n in each board
        print("===> finding n in boards: \(numbers[n])")
        let _ = updateAllBoards(n: n)
//        if updateAllBoards(n: n) {
//            print("***** winner on \(numbers[n]) \n")
//            break
//        }
        print("")
        //let _ = updateAllBoards(n: n)

    }
    //print("==== \(boards)")

}

func updateAllBoards(n: Int) -> Bool {
    for b in 0..<boards.count {
        //print("board: \(board)")
        for row in 0..<5 {
            for col in 0..<5 {
                if boards[b][row,col] == numbers[n] {
                    boards[b][row,col] = -1
                    let _ = doWeHaveAwinner(n: numbers[n])
//                    if doWeHaveAwinner(n: numbers[n]) {
//                        print("** winner on board \(b) n = \(numbers[n])")
//                        //return true
//                    }
                }
            }
        }
    }
    // no winner yet
    return false
}

func doWeHaveAwinner(n: Int) -> Bool {
    if doWeHaveAColWinner(n:n) {
        print ("col winner at n: \(n)")
        //return true
    }
    if doWeHaveARowWinner(n:n) {
        print ("row winner at n: \(n)")
        //return true
    }
    return false
}

func calcScore(board: Int, n: Int) {
    var sum = 0
    for row in 0..<5 {
        for col in 0..<5 {
            if boards[board][row,col] != -1 {
                sum += boards[board][row,col]
            }
        }
    }
    print("sum = \(sum)")
    print("score = n * sum = \(n) * \(sum) = \(n*sum)")

    boardWinCount.remove(board)
    print("boardWinCount = \(boardWinCount)")
    if boardWinCount.isEmpty {
        print("######## Last board to win:  \(board) n = \(numbers[n]) score = \(n*sum)")
        exit(0)
    }

}

func doWeHaveAColWinner(n: Int) -> Bool {
    for b in 0..<boards.count {
        //print("board: \(board)")
        for col in 0..<5 {
            if boards[b][0,col] == -1 &&
                boards[b][1,col] == -1 &&
                boards[b][2,col] == -1 &&
                boards[b][3,col] == -1 &&
                boards[b][4,col] == -1 {
                print("row winner on board: \(b)")
                calcScore(board: b,n: n)
                //return true
            }
        }
    }
    // no winner
    return false
}
func doWeHaveARowWinner(n: Int) -> Bool {
    for b in 0..<boards.count {
        //print("board: \(board)")
        for row in 0..<5 {
            if boards[b][row,0] == -1 &&
                boards[b][row,1] == -1 &&
                boards[b][row,2] == -1 &&
                boards[b][row,3] == -1 &&
                boards[b][row,4] == -1 {
                print("row winner on board: \(b)")
                calcScore(board: b,n: n)
                //return true
            }
        }
    }
    // no winner
    return false
}

