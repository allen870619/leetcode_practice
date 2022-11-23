class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowDict = [Int: [Character]]()
        var colDict = [Int: [Character]]()
        var matrix = Array(repeating: Array(repeating: [Character](), count: 3), count: 3)

        for y in 0 ... 8 {
            for x in 0 ... 8 {
                let target = board[y][x]
                if target != "." {
                    if matrix[y / 3][x / 3].contains(target) {
                        return false
                    }

                    if rowDict[y, default: []].contains(target) {
                        return false
                    }

                    if colDict[x, default: []].contains(target) {
                        return false
                    }
                    matrix[y / 3][x / 3].append(board[y][x])
                    rowDict[y, default: []].append(board[y][x])
                    colDict[x, default: []].append(board[y][x])
                }
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.isValidSudoku([["5", "3", ".", ".", "7", ".", ".", ".", "."], ["6", ".", ".", "1", "9", "5", ".", ".", "."], [".", "9", "8", ".", ".", ".", ".", "6", "."], ["8", ".", ".", ".", "6", ".", ".", ".", "3"], ["4", ".", ".", "8", ".", "3", ".", ".", "1"], ["7", ".", ".", ".", "2", ".", ".", ".", "6"], [".", "6", ".", ".", ".", ".", "2", "8", "."], [".", ".", ".", "4", "1", "9", ".", ".", "5"], [".", ".", ".", ".", "8", ".", ".", "7", "9"]]))
