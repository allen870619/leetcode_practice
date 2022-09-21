class Solution { // optimized from Sol_AC
    func minimumRemoval(_ beans: [Int]) -> Int {
        if beans.count <= 1 {
            return 0
        }

        // init
        let count = beans.count
        let beans = beans.sorted()
        var total = beans.reduce(0, +)
        var result = Int.max
        var index = 0

        // cal
        while index < count {
            result = min(result, total - (count - index) * beans[index])
            index += 1
        }
        return result
    }
}

class Solution_AC {
    func minimumRemoval(_ beans: [Int]) -> Int {
        if beans.count <= 1 {
            return 0
        }

        // init
        let count = beans.count
        let beans = beans.sorted()
        var total = beans.reduce(0, +)
        var index = 0
        var left = 0
        var right = total - (count - index) * beans[index]
        var result = left + right
        index += 1

        // cal
        while index < count {
            var tmpLeft = left + beans[index]
            var tmpRight = total - tmpLeft - (count - index) * beans[index]
            result = min(result, tmpLeft + tmpRight)
            index += 1
            left = tmpLeft
        }
        return result
    }
}

class Solution2 { // TLE
    func minimumRemoval(_ beans: [Int]) -> Int {
        var run: [Int] = []
        var result = Int.max

        for ref in beans {
            var tmp = 0
            if !run.contains(ref) {
                for num in beans {
                    tmp += num - ref >= 0 ? num - ref : num
                }
                run.append(ref)
                result = min(result, tmp)
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.minimumRemoval([4, 1, 6, 5]))
print(sol.minimumRemoval([3, 5, 1, 7, 19, 23, 14]))
print(sol.minimumRemoval([2, 10, 3, 2]))
print(sol.minimumRemoval([23, 52, 45, 28, 84, 3, 82, 87]))
print(sol.minimumRemoval([93, 35, 42, 63, 2, 40, 71, 22, 48, 95, 100, 77, 12, 79, 32, 76, 29, 38, 33, 98, 79, 76, 97, 51, 13, 33, 87, 48, 81, 99, 100, 88, 39, 78, 99, 3, 38, 84, 80, 29, 58, 14, 83, 25, 97, 38, 19, 52, 88, 31, 51, 94, 15, 7, 64, 84, 22, 27, 1, 65, 80, 9, 96, 43, 52, 35, 91, 38, 16, 98, 31, 66, 17, 74, 78, 77, 77, 93, 94, 16, 40, 5, 63, 14, 59, 75]))
