class Solution { //TLE
    var n = 0
    var nodeDict: [Set<Int>]!
    
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        self.n = n
        nodeDict = Array.init(repeating: Set(), count: n)
        
        for i in edges{
            nodeDict[i[0]].insert(i[1])
            nodeDict[i[1]].insert(i[0])
        }
        
        var step: [Int] = []
        var minStep = n
        for i in 0..<nodeDict.count{
            let s = findRoute(from: i, finded: [], count: 0)
            step.append(s)
            minStep = min(minStep, s)
        }
        
        var result: [Int]  = []
        for i in 0..<step.count{
            if step[i] == minStep{
                result.append(i)
            }
        }
        return result
    }
    
    func findRoute(from: Int, finded: Set<Int>, count: Int) -> Int{
        if count > n / 2{
            return count
        }
        if finded.count == n{
            return count
        }
        
        var finded = finded
        finded.insert(from)
        var result = count
        for i in nodeDict[from]{
            if !finded.contains(i){
                finded.insert(i)
                result = max(result, findRoute(from: i, finded: finded, count: count + 1))
                if result > n / 2{
                    return result
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.findMinHeightTrees(6,[[3,0],[3,1],[3,2],[3,4],[5,4]]))
print(sol.findMinHeightTrees(4,[[1,0],[1,2],[1,3]]))
print(sol.findMinHeightTrees(1,[]))
print(sol.findMinHeightTrees(2, [[0,1]]))
print(sol.findMinHeightTrees(3, [[0,1], [0, 2]]))
print(sol.findMinHeightTrees(5, [[0,1],[0,2],[0,3],[3,4]]))
