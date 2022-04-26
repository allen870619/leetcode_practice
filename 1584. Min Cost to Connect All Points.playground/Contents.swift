class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        if points.count <= 1{
            return 0
        }
        
        var groupsTotal = Array(repeating: 0, count: points.count)
        var pointGroup = Array(repeating: 0, count: points.count)
        var nextGroup = 1
        // sep to groups
        for (i1, p1) in points.enumerated(){
            var minD = Int.max
            var minIndex = 0
            
            if pointGroup[i1] == 0{
                for (i2, p2) in points.enumerated(){
                    if i1 != i2{
                        let d = calDistance(p1, p2)
                        if d < minD{
                            minD = d
                            minIndex = i2
                        }
                    }
                }
                
                if pointGroup[minIndex] == 0{
                    groupsTotal[nextGroup] = minD
                    pointGroup[i1] = nextGroup
                    pointGroup[minIndex] = nextGroup
                    nextGroup += 1
                }else{
                    groupsTotal[pointGroup[minIndex]] += minD
                    pointGroup[i1] = pointGroup[minIndex]
                }
            }
        }
        
        // link groups
        var total = groupsTotal.reduce(0, +)
        for _ in 1..<nextGroup-1{
            var minD = Int.max
            var minGroup = -1
            for (i1, p1) in points.enumerated(){
                if pointGroup[i1] == 1{
                    for (i2, p2) in points.enumerated(){
                        if pointGroup[i2] > 1{
                            let d = calDistance(p1, p2)
                            if d < minD{
                                minD = d
                                minGroup = pointGroup[i2]
                            }
                        }
                    }
                }
            }

            total += minD
            for i in 0..<pointGroup.count{
                if pointGroup[i] == minGroup{
                    pointGroup[i] = 1
                }
            }
        }
        
        return total
    }
    
    private func calDistance(_ a: [Int], _ b: [Int]) -> Int{
        return abs(a[0] - b[0]) + abs(a[1] - b[1])
    }
}

let sol = Solution()
print(sol.minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))
print(sol.minCostConnectPoints([[3,12],[-2,5],[-4,1]]))
print(sol.minCostConnectPoints([[2,-3],[-17,-8],[13,8],[-17,-15]]))
print(sol.minCostConnectPoints([[-8,14],[16,-18],[-19,-13],[-18,19],[20,20],[13,-20],[-15,9],[-4,-8]]))
