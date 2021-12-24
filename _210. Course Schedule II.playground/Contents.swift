class Solution {
    
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var ori: [Int: Set<Int>] = [:]
        for i in prerequisites{
            let key = i[1]
            if ori[key] == nil{
                ori[key] = [i[0]]
            }else{
                ori[key]?.insert(i[0])
            }
        }
        
        for i in 0..<numCourses{
            if check(dict: ori, target: i, result: []).contains(-1){
                return []
            }
        }
        
        var ans: [Int] = []
        for i in ori.sorted(by: {$0.key < $1.key}){
            let key = i.key
            var index = ans.count
            for value in i.value{
                if !ans.contains(value){
                    ans.append(value)
                    index = min(index, ans.count - 1)
                }else{
                    index = min(index, ans.firstIndex(of: value)!)
                }
            }
            let keyIndex = ans.firstIndex(of: key)
            if let keyIndex = keyIndex{
                if keyIndex > index{
                    ans.remove(at: keyIndex)
                    ans.insert(key, at: index)
                }
            }else{
                ans.insert(key, at: index)
            }
        }

        for i in 0..<numCourses{
            if !ans.contains(i){
                ans.append(i)
            }
        }
        return ans
    }
    
    func check(dict: [Int: Set<Int>], target: Int, result: [Int])->[Int]{
        var result = result
        if result.contains(target){
            result.append(-1)
            return result
        }
        result.append(target)
        if let list = dict[target]{
            for i in list{
                if check(dict: dict, target: i, result: result).contains(-1){
                    return [-1]
                }
            }
        }
        return result
    }
}

let sol = Solution()
//print(sol.findOrder(3, [[1,0],[2,1],[0,2]])) // error
//print(sol.findOrder(4, [[1,0],[2,1],[3,2],[1,3]])) // error
print(sol.findOrder(3, []))
print(sol.findOrder(3, [[0,1],[0,2],[1,2]]))
print(sol.findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
print(sol.findOrder(7, [[4,1],[4,2],[0,3],[1,0],[2,0]]))
print(sol.findOrder(8, [[1,0],[2,6],[1,7],[6,4],[7,0],[0,5]]))
print(sol.findOrder(10, [[5,6],[0,2],[1,7],[5,9],[1,8],[3,4],[0,6],[0,7],[0,3],[8,9]]))


