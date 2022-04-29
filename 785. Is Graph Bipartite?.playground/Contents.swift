class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var mark = Array(repeating: 0, count: graph.count)
        var stack = [0]
        while !stack.isEmpty{
            let target = stack.removeFirst()
            let neighbor = graph[target]
            var neiMark = 0
            if mark[target] == 0{
                mark[target] = -1
                neiMark = 1
            }else{
                neiMark = mark[target] == 1 ? -1 : 1
            }
            for i in neighbor{
                if mark[i] == 0{
                    stack.append(i)
                    mark[i] = neiMark
                }else if mark[i] != neiMark{
                    return false
                }
            }
            if stack.isEmpty{
                for (index, flag) in mark.enumerated(){
                    if flag == 0{
                        stack.append(index)
                        break
                    }
                }
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]]))
print(sol.isBipartite(([[1,3],[0,2],[1,3],[0,2]])))
print(sol.isBipartite([[1],[0,3],[3],[1,2]]))
print(sol.isBipartite([[3],[2,4],[1],[0,4],[1,3]]))
print(sol.isBipartite([[],[2,4,6],[1,4,8,9],[7,8],[1,2,8,9],[6,9],[1,5,7,8,9],[3,6,9],[2,3,4,6,9],[2,4,5,6,7,8]]))
