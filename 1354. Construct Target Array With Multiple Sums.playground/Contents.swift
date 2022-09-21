class Solution {
    func isPossible(_ target: [Int]) -> Bool {
        if target.count <= 1 {
            return target[0] == 1
        }
        var target = target.sorted()
        var total = target.reduce(0, +)

        while target.last! > 1 {
            var last = target.removeLast()
            var remain = total - last
            if last == 1 || remain == 1 {
                return true
            }
            let x = last % remain
            if x == 0 || x == last {
                return false
            }
            total = remain + x
            target.append(x)
            target.sort()
        }
        return true
    }
}

let sol = Solution()
print(sol.isPossible([9, 3, 5]))
print(sol.isPossible([2, 1]))
print(sol.isPossible([2]))
print(sol.isPossible([8, 5]))
print(sol.isPossible([1, 1, 1, 2]))
print(sol.isPossible([2, 900_000_001]))
print(sol.isPossible([1, 1, 61, 9, 17]))
