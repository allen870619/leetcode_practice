class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let width = matrix.first!.count; let height = matrix.count
        var arr = Array(repeating:Array(repeating: 0, count: height), count: width)
        for i in 0..<height{
            for j in 0..<width{
                arr[j][i] = matrix[i][j]
            }
        }
        return arr
    }
}
