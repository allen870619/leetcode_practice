class Solution {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        let total = matrix.count
        for pos in 0..<total{
            var numSet: Set<Int> = []
            // check row
            for i in 0..<total{
                numSet.insert(matrix[i][pos])
            }
            if numSet.count != total{
                return false
            }
            
            numSet = []
            // check row
            for i in 0..<total{
                numSet.insert(matrix[pos][i])
            }
            if numSet.count != total{
                return false
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.checkValid([[1,1,1],[1,2,3],[1,2,3]]))
