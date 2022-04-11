class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        if k == 0{
            return grid
        }
        let row = grid.first!.count
        let col = grid.count
        var newArr = Array(repeating: Array(repeating: 0, count: row), count: col)
        
        let total = row * col
        let k = total - (k % total)
        var startC = (k / row) % col
        var startR = k % row
        
        for c in 0..<col{
            for r in 0..<row{
                newArr[c][r] = grid[startC][startR]
                startR += 1
                if startR == row{
                    startR = 0
                    startC += 1
                }
                if startC == col{
                    startC = 0
                }
            }
        }
        return newArr
        
    }
}
