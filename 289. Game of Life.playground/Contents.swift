class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let row = board.first!.count
        let col = board.count
        var newArr = Array(repeating: Array(repeating: 0, count: row), count: col)

        for i in 0 ..< col {
            for j in 0 ..< row {
                let round = addRound(board, i, j)
                if board[i][j] == 0 {
                    newArr[i][j] = round == 3 ? 1 : 0
                } else {
                    newArr[i][j] = (round == 2 || round == 3) ? 1 : 0
                }
            }
        }
        board = newArr
    }

    private func addRound(_ data: [[Int]], _ col: Int, _ row: Int) -> Int {
        var total = 0
        for i in col - 1 ... col + 1 {
            if i >= 0, i < data.count {
                for j in row - 1 ... row + 1 {
                    if j >= 0, j < data.first!.count {
                        total += data[i][j]
                    }
                }
            }
        }
        return total - data[col][row]
    }
}

let sol = Solution()
var a = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]
sol.gameOfLife(&a)
print(a)
