class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var result = 0
        var climb = [Int]()
        var totalClimb = 0
        var ladders = ladders
        var last = heights[0]
        for i in heights[1...] {
            if i - last > 0 {
                totalClimb += i - last
                climb.append(i - last)
                if totalClimb > bricks {
                    if ladders == 0 {
                        break
                    }
                    let largest = climb.max() ?? 0
                    totalClimb -= largest
                    if let index = climb.firstIndex(of: largest) {
                        climb.remove(at: index)
                    }
                    ladders -= 1
                }
            }
            last = i
            result += 1
        }

        return result
    }
}

class Solution2 { // TLE
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var result = 0
        var climbList = [Int]()
        var totalClimb = 0
        var last = heights[0]
        for i in heights[1...] {
            let climb = i - last
            if climb > 0 {
                climbList.append(climb)
                if climbList.count > ladders {
                    climbList.sort()
                    totalClimb += climbList.removeFirst()
                    if totalClimb > bricks {
                        break
                    }
                }
            }
            last = i
            result += 1
        }

        return result
    }
}

let sol = Solution()
print(sol.furthestBuilding([4, 2, 7, 6, 9, 14, 12], 5, 1))
print(sol.furthestBuilding([4, 12, 2, 7, 3, 18, 20, 3, 19], 10, 2))
print(sol.furthestBuilding([14, 3, 19, 3], 17, 0))
