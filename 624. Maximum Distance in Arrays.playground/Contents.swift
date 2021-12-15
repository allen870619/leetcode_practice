class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var maxList: [Int] = []
        var minList: [Int] = []
        var maxVal = arrays[0].last!
        var maxIndex = 0
        
        var minVal = arrays[0][0]
        var minIndex = 0
        
        for i in 0..<arrays.count{
            maxList.append(arrays[i].last!)
            minList.append(arrays[i][0])
            if arrays[i].last! > maxVal{
                maxVal = arrays[i].last!
                maxIndex = i
            }
            
            if arrays[i][0] < minVal{
                minVal = arrays[i][0]
                minIndex = i
            }
        }
        
        var disA = 0
        var disB = 0
        var mList = minList
        mList.remove(at: maxIndex)
        for i in mList{
            disA = max(disA, maxVal - i)
        }
        
        var maList = maxList
        maList.remove(at: minIndex)
        for i in maList{
            disB = max(disB, i - minVal)
        }
        return max(disA, disB)
    }
}

class Solution2 {
    func maxDistance(_ list: [[Int]]) -> Int {
        var res = 0;
        var min_val = list[0][0];
        var max_val = list[0][list[0].count - 1];
        for i in 1..<list.count {
            res = max(res, max(abs(list[i][list[i].count - 1] - min_val), abs(max_val - list[i][0])))
            min_val = min(min_val, list[i][0])
            max_val = max(max_val, list[i][list[i].count - 1])
        }
        return res;
    }
}

let sol = Solution2()
print(sol.maxDistance([[1,2,3],[4,5],[1,2,3]]))
print(sol.maxDistance([[1],[1]]))
print(sol.maxDistance([[1],[2]]))
print(sol.maxDistance([[1,4],[0,5]]))
print(sol.maxDistance([[-8,-7,-7,-5,1,1,3,4],[-2],[-10,-10,-7,0,1,3],[2]]))
print(sol.maxDistance([[1,5],[3,4]]))
