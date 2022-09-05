class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        if root == nil {
            return []
        }
        var result = [[Int]]()
        var list = [root]
        while  !list.isEmpty{
            var tmp = [Int]()
            for i in list {
                let n = list.removeFirst()
                tmp.append(n?.val ?? 0)
                list += n?.children ?? []
            }
            result.append(tmp)
        }
        return result
    }
    
}
