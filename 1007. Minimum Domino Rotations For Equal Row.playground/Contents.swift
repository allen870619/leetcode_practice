class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        var set: Set<Int> = [tops[0], bottoms[0]]
        for i in 1..<tops.count{
            let tmp : Set<Int> = [tops[i] , bottoms[i]]
            set = set.intersection(tmp)
            if set.count == 0{
                return -1
            }
            if set.count == 1{
                break
            }
        }
        
        var a = set.popFirst()
        var countTop = 0
        var countBot = 0
        for i in 0..<tops.count{
            if tops[i] == a{
                countTop += 1
            }
            if bottoms[i] == a{
                countBot += 1
            }
        }
        
        var count = min(countTop, countBot, tops.count - countTop, bottoms.count - countBot)
        return count
    }
}
