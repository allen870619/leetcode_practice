class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var result = [Int]()
        var dist: [(value: Int, distance: Int)] = arr.map { ($0, abs($0 - x)) }

        // sort
        dist.sort {
            if $0.distance != $1.distance {
                return $0.distance < $1.distance
            } else {
                return $0.value < $1.value
            }
        }

        // get answer
        for i in 0 ..< k {
            result.append(dist[i].value)
        }
        return result.sorted()
    }
}

let sol = Solution()
print(sol.findClosestElements([1, 2, 3, 4, 5], 4, 4))
print(sol.findClosestElements([1, 2, 3, 4, 5], 4, 3))
