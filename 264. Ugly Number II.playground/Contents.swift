class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }

        var contain = [Int: Bool]()
        var list = [1]
        var count = 1
        while count < n {
            var i = list.removeFirst()
            if contain[i * 2] == nil {
                list.append(i * 2)
                contain[i * 2] = true
            }
            if contain[i * 3] == nil {
                list.append(i * 3)
                contain[i * 3] = true
            }
            if contain[i * 5] == nil {
                list.append(i * 5)
                contain[i * 5] = true
            }
            list.sort()
            count += 1
        }
        return list.removeFirst()
    }
}

class Solution2 { // best
    func nthUglyNumber(_ n: Int) -> Int {
        var list = [1]
        var ratio2 = 0, ratio3 = 0, ratio5 = 0

        for _ in 1 ..< n {
            let v = min(list[ratio2] * 2, list[ratio3] * 3, list[ratio5] * 5)
            list.append(v)
            if v == list[ratio2] * 2 {
                ratio2 += 1
            }
            if v == list[ratio3] * 3 {
                ratio3 += 1
            }
            if v == list[ratio5] * 5 {
                ratio5 += 1
            }
        }
        return list[n - 1]
    }
}

let sol = Solution2()
print(sol.nthUglyNumber(100))
