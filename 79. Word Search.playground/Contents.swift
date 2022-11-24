class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = [Character](word)
        let maxY = board.count
        let maxX = board.first?.count ?? 0

        for y in 0 ..< maxY {
            for x in 0 ..< maxX {
                if board[y][x] == word[0] {
                    let run = Array(repeating: Array(repeating: false, count: maxX), count: maxY)
                    if findWord(fromY: y, fromX: x, wordIndex: 0, run) {
                        return true
                    }
                }
            }
        }

        func findWord(fromY: Int, fromX: Int, wordIndex: Int, _ run: [[Bool]]) -> Bool {
            if wordIndex == word.count {
                return true
            }
            if !((0 ..< maxX).contains(fromX) && (0 ..< maxY).contains(fromY)) || run[fromY][fromX] {
                return false
            }
            if board[fromY][fromX] != word[wordIndex] {
                return false
            }
            var run = run
            run[fromY][fromX] = true

            return findWord(fromY: fromY, fromX: fromX + 1, wordIndex: wordIndex + 1, run) ||
                findWord(fromY: fromY + 1, fromX: fromX, wordIndex: wordIndex + 1, run) ||
                findWord(fromY: fromY, fromX: fromX - 1, wordIndex: wordIndex + 1, run) ||
                findWord(fromY: fromY - 1, fromX: fromX, wordIndex: wordIndex + 1, run)
        }
        return false
    }
}

let sol = Solution()
print(sol.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCCED"))
print(sol.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "SEE"))
print(sol.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCB"))
print(sol.exist([["A"]], "A"))
print(sol.exist([["A", "B", "C", "E"], ["S", "F", "E", "S"], ["A", "D", "E", "E"]], "ABCEFSADEESE"))
