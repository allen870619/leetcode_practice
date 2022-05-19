class Solution {// AC but need optimized
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let w  = matrix.last?.count ?? 0
        let h = matrix.count ?? 0
        let dir = [(-1,0),(0,-1),(1,0),(0,1)]
        var result = 1
        var hisStep = Array(repeating: Array(repeating: [Int](), count: w), count: h)
        
        func dfs(y: Int, x: Int) -> [Int]{
            var tmp = [[Int]]()
            for (i, dir) in dir.enumerated(){
                let newY = y+dir.0
                let newX = x+dir.1
                if newY >= 0 && newY < h && newX >= 0 && newX < w{
                    if(matrix[newY][newX]>matrix[y][x]){
                        if hisStep[newY][newX].isEmpty{
                            tmp.append([matrix[y][x]] + dfs(y: newY, x: newX))
                        }else{
                            tmp.append([matrix[y][x]] + hisStep[newY][newX])
                        }
                    }
                }
            }
            if tmp.isEmpty{
                hisStep[y][x] = [matrix[y][x]]
                return [matrix[y][x]]
            }else{
                let arr = tmp.max(by: {$0.count<$1.count})!
                hisStep[y][x] = arr
                result = max(result, arr.count)
                return arr
            }
        }
        
        for y in 0..<h{
            for x in 0..<w{
                if(hisStep[y][x].isEmpty){
                    let arr = dfs(y: y, x: x)
                    hisStep[y][x] = arr
                    result = max(result, arr.count)
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.longestIncreasingPath([[9,9,4],[6,6,8],[2,1,1]]))
print(sol.longestIncreasingPath([[3,4,5],[3,2,6],[2,2,1]]))
print(sol.longestIncreasingPath([[1]]))
