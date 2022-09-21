class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        let words = words.sorted { $0.count < $1.count }
        var maxList = [String: Int]()
        var lenList = [Int]()
        for i in words {
            if !lenList.contains(i.count) {
                lenList.append(i.count)
            }
        }
        lenList.sort()
        for i in words {
            if maxList[i] == nil {
                calLong(i, i.count)
            }
        }

        func calLong(_ target: String, _ count: Int) -> Int {
            maxList[target] = 1
            if lenList.contains(count + 1) {
                let list = words.filter { $0.count == count + 1 }
                for i in list {
                    if compare(target, i) {
                        if maxList[i] == nil {
                            maxList[target] = max(maxList[target]!, 1 + calLong(i, count + 1))
                        } else {
                            maxList[target] = max(maxList[target]!, 1 + maxList[i]!)
                        }
                    }
                }
            }
            return maxList[target] ?? 0
        }
        return maxList.values.max() ?? 0
    }

    func compare(_ s1: String, _ s2: String) -> Bool {
        var i1 = 0
        var i2 = 0
        var isDiff = false
        var s1 = [Character](s1)
        var s2 = [Character](s2)
        while i1 < s1.count {
            if s1[i1] != s2[i2] {
                if isDiff {
                    return false
                }
                i2 += 1
                isDiff = true
            } else {
                i1 += 1
                i2 += 1
            }
        }
        return true
    }
}

class Solution2 { // better
    func longestStrChain(_ words: [String]) -> Int {
        var map = [String: Int]()
        let words = words.sorted(by: { $0.count > $1.count })
        for i in words {
            map[i] = 1
        }
        for word in words {
            var arr = [Character](word)
            for i in 0 ..< arr.count {
                var c = arr.remove(at: i)
                if let val = map[String(arr)] {
                    map[String(arr)] = max(val, map[word]! + 1)
                }
                arr.insert(c, at: i)
            }
        }
        return map.values.max() ?? 0
    }
}

let sol = Solution2()
print(sol.longestStrChain(["a", "b", "ba", "bca", "bda", "bdca"]))
print(sol.longestStrChain(["xbc", "pcxbcf", "xb", "cxbc", "pcxbc"]))
print(sol.longestStrChain(["abcd", "dbqca"]))

print(sol.longestStrChain(["qyssedya", "pabouk", "mjwdrbqwp", "vylodpmwp", "nfyqeowa", "pu", "paboukc", "qssedya", "lopmw", "nfyqowa", "vlodpmw", "mwdrqwp", "opmw", "qsda", "neo", "qyssedhyac", "pmw", "lodpmw", "mjwdrqwp", "eo", "nfqwa", "pabuk", "nfyqwa", "qssdya", "qsdya", "qyssedhya", "pabu", "nqwa", "pabqoukc", "pbu", "mw", "vlodpmwp", "x", "xr"]))
