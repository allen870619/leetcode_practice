class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let boxTypes = boxTypes.sorted { $0[1] > $1[1] }
        var result = 0
        var boxes = 0
        for i in boxTypes{
            let tmp = i[0] * i[1]
            if boxes + i[0] <= truckSize{
                result += tmp
                boxes += i[0]
            }else{
                let remain = truckSize - boxes
                result += remain * i[1]
                boxes += remain
                break
            }
            
        }
        return result
    }
}

let sol = Solution()
print(sol.maximumUnits([[1,3],[2,2],[3,1]], 4))
print(sol.maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10))
