class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int]()
        for i in 0 ... n {
            result.append(cal(i))
        }
        return result
    }

    private func cal(_ num: Int) -> Int {
        var total = 0
        var cal = num
        while cal > 0 {
            total += cal % 2
            cal /= 2
        }
        return total
    }
}

class Solution2 {
    func countBits(_ n: Int) -> [Int] {
        var cMax = 1
        var index = 0
        var result = Array(repeating: 0, count: n + 1)
        if n == 0 {
            return result
        }
        for i in 1 ... n {
            result[i] = result[index] + 1
            if result[index] + 1 >= cMax {
                cMax += 1
                index = 0
            } else {
                index += 1
            }
        }
        return result
    }
}

class Solution3 {
    func countBits(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n + 1)
        if n == 0 {
            return result
        }
        for i in 1 ... n {
            result[i] = result[i & (i - 1)] + 1
        }
        return result
    }
}

let sol = Solution2()
print(sol.countBits(0))
print(sol.countBits(1))
print(sol.countBits(2))
print(sol.countBits(5))
print(sol.countBits(20))
