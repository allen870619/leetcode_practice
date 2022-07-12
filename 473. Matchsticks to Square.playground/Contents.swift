class Solution {
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        if sum % 4 != 0{
            return false
        }
        let width = sum / 4
        var matchsticks = matchsticks.sorted{$0 > $1}
        var edge = Array(repeating: 0, count: 4)
        
        
        func cal(_ index: Int) -> Bool{
            if index >= matchsticks.count{
                return edge[0] == width && edge[1] == width && edge[2] == width
            }
            
            for i in 0...3{
                if edge[i] + matchsticks[index] <= width{
                    edge[i] += matchsticks[index]
                    if(cal(index+1)){
                        return true
                    }
                    edge[i] -= matchsticks[index]
                }
            }
            return false
        }
        
        return cal(0)
    }
}

let sol = Solution()
print(sol.makesquare([1,1,2,2,2]))
print(sol.makesquare([3,3,3,3,4]))
print(sol.makesquare([5,5,5,5,4,4,4,4,3,3,3,3]))
