class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var total = 0
        var left = 0
        var right = people.count - 1

        while left <= right {
            if people[left] + people[right] <= limit {
                left += 1
                right -= 1
            } else if people[right] <= limit {
                right -= 1
            }
            total += 1
        }
        return total
    }
}

let sol = Solution()
print(sol.numRescueBoats([1, 2], 3))
print(sol.numRescueBoats([3, 2, 2, 1], 3))
print(sol.numRescueBoats([3, 5, 3, 4], 5))
