class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var maxDist = 0
        var lastPer = -1
        for i in 0..<seats.count{
            if seats[i] == 1{
                if lastPer == -1{
                    maxDist = i
                }else{
                    maxDist = max((i - lastPer) / 2, maxDist)
                }
                lastPer = i
            }
        }
        maxDist = max(seats.count - lastPer - 1, maxDist)
        return maxDist
    }
}

let sol = Solution()
print(sol.maxDistToClosest([1,0,0,0,1,0,1]))
print(sol.maxDistToClosest([1,0,0,0]))
print(sol.maxDistToClosest([0,1]))
print(sol.maxDistToClosest([0,0,1]))
