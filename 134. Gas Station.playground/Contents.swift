class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0
        var cur = 0
        var index = 0
        for i in 0..<gas.count{
            total += gas[i] - cost[i]
            cur += gas[i] - cost[i]
            if cur < 0{
                cur = 0
                index = i + 1
            }
        }
        return total >= 0 ? index : -1
    }
}

class Solution2 {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let costs = cost.reduce(0, {$1})
        if costs == 0{
            for i in 0..<gas.count{
                if gas[i] != 0{
                    return i
                }
            }
            return 0
        }
        
        for i in 0..<gas.count{
            if gas[i] >= cost[i]{
                var count = 0
                for j in 0..<gas.count{
                    var index = i+j
                    if index >= gas.count{
                        index -= gas.count
                    }
                    count += gas[index] - cost[index]
                    if count < 0{
                        break
                    }
                }
                if count >= 0{
                    return i
                }
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.canCompleteCircuit([0,0,0,0,0,0,0],  [0,0,0,0,0,0,0]))
print(sol.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))
