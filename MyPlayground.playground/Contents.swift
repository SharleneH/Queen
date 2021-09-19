import UIKit
import Foundation
/*
 [".Q..",  // Solution 1
   "...Q",
   "Q...",
   "..Q."],
  
  ["..Q.",  // Solution 2
   "Q...",
   "...Q",
   ".Q.."]
*/

// leftline = x + y = c
// rightline = x - y = c
struct Puzzle {
    var row: Int = 0
    var col: Int = 0
}
var queen : [[String]] = [[]]
var puzzle = Puzzle()
func queenPosition(position: Int){
   //row
    for y in 0 ..< position {
        //col
        for x in y ..< position {
            //若設 puzzle row 與 col 與 x y相符 則代表 q
            if puzzle.row  == y && puzzle.col == x {
                queen[x][y] = "Q"
//                print("與puzzle row & col 相同 \(x)\(y)")
            //若同列不同排則為.
            }else if puzzle.row == y && puzzle.col != x{
                queen[x][y] = "."
//                print("同列不同排 \(x),\(y)")
            //若同行不同列
            }else if puzzle.row != y && puzzle.col == x {
                queen[x][y] = "."
//                print("同行不同列\(x)\(y)")
            //左斜線
            }else if (x + y) == (puzzle.row + puzzle.col) {
                queen[x][y] = "."
//                print("左斜線\(x)\(y)")
            //右斜線
            }else if (x - y) == (puzzle.row - puzzle.col) {
                queen[x][y] = "."
//                print("右斜線\(x)\(y)")
            //換行、換列
            }else if (x + y) == (puzzle.row + puzzle.col) &&
                        (x - y) == (puzzle.row - puzzle.col) &&
                        x != puzzle.col && y != puzzle.row{
                puzzle.col = x
                puzzle.row = y
                queen[x][y] = "Q"
//                print("換行、換列\(x)\(y)")
            }
        }
    }
}


queenPosition(position: 8)
var str = queen.map({ $0.joined()})
print(str)
