class Solution2 { // faster
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character: Int]()
        let order = [Character](order)

        for (index, i) in order.enumerated() {
            dict[i] = index
        }

        for i in 0 ..< words.count - 1 {
            if !compare(words[i], words[i + 1]) {
                return false
            }
        }

        func compare(_ w1: String, _ w2: String) -> Bool {
            let size = min(w1.count, w2.count)
            let w1 = [Character](w1), w2 = [Character](w2)

            for i in 0 ..< size {
                if dict[w1[i]]! < dict[w2[i]]! {
                    return true
                } else if dict[w1[i]]! > dict[w2[i]]! {
                    return false
                }
            }
            return w1.count <= w2.count
        }

        return true
    }
}

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character: Int]()
        let order = [Character](order)

        for (index, i) in order.enumerated() {
            dict[i] = index
        }

        let sortWords = words.sorted(by: { w1, w2 in
            let size = min(w1.count, w2.count)
            let w1 = [Character](w1), w2 = [Character](w2)

            for i in 0 ..< size where dict[w1[i]]! != dict[w2[i]]! {
                return dict[w1[i]]! < dict[w2[i]]!
            }
            return w1.count <= w2.count
        })
        return words == sortWords
    }
}

let sol = Solution2()
print(sol.isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
print(sol.isAlienSorted(["word", "world", "row"], "worldabcefghijkmnpqstuvxyz"))
