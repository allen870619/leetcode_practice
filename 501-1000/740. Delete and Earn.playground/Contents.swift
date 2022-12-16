class Solution { // better
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var arr = Array(repeating: 0, count: 10001)
        for i in nums {
            arr[i] += 1
        }

        var result = 0
        var last = Int.min
        var tmp = [Int]()
        for (i, num) in arr.enumerated() {
            let cur = i * num
            if i != last + 1 {
                result += tmp.last ?? 0
                tmp = [cur]
            } else {
                let count = tmp.count
                if count == 0 {
                    tmp.append(cur)
                } else {
                    let added = count == 1 ? cur : cur + tmp[count - 2]
                    if tmp.last! >= added {
                        result += tmp.last!
                        tmp.removeAll()
                    } else {
                        tmp.append(added)
                    }
                }
            }
            last = i
        }
        return result + (tmp.last ?? 0)
    }
}

class Solution2 {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var table = [Int: Int]()
        for i in nums {
            if table[i] == nil {
                table[i] = 1
            } else {
                table[i]! += 1
            }
        }
        let arr = table.sorted(by: { $0.key < $1.key })

        var result = 0
        var last = Int.min
        var tmp = [Int]()
        for i in arr {
            if i.key != last + 1 {
                result += tmp.last ?? 0
                tmp = [i.key * i.value]
            } else {
                let count = tmp.count
                let cur = i.key * i.value
                if count == 0 {
                    tmp.append(cur)
                } else if count == 1 {
                    if tmp[0] >= cur {
                        result += tmp.last ?? 0
                        tmp.removeAll()
                    } else {
                        tmp.append(cur)
                    }
                } else {
                    if tmp.last! >= cur + tmp[count - 2] {
                        result += tmp.last ?? 0
                        tmp.removeAll()
                    } else {
                        tmp.append(cur + tmp[count - 2])
                    }
                }
            }
            last = i.key
        }
        result += tmp.last ?? 0
        return result
    }
}

let sol = Solution()
print(sol.deleteAndEarn([3, 4, 2]))
print(sol.deleteAndEarn([2, 2, 3, 3, 3, 4]))
print(sol.deleteAndEarn([1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 7, 7]))
