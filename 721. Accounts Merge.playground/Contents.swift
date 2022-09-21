class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let accounts = accounts.sorted(by: { $0[0] < $1[0] })
        var result: [(name: String, acc: Set<String>)] = []
        for i in accounts {
            result.append((i[0], Set(i[1...])))
        }

        // sort
        var isDone = false
        while !isDone {
            isDone = true
            var c1 = 0
            var c2 = c1 + 1
            while c1 < result.count {
                while c2 < result.count {
                    if result[c1].name == result[c2].name {
                        if result[c1].acc.intersection(result[c2].acc).count > 0 {
                            result[c1].acc = result[c1].acc.union(result[c2].acc)
                            result.remove(at: c2)
                            isDone = false
                        } else {
                            c2 += 1
                        }
                    } else {
                        break
                    }
                }
                c1 += 1
                c2 = c1 + 1
            }
        }

        var ans: [[String]] = []
        for i in result {
            ans.append([i.name] + i.acc.sorted())
        }
        return ans
    }
}

let sol = Solution()
var a: [[String]] = []
a = [["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["John", "johnsmith@mail.com", "john00@mail.com"], ["Mary", "mary@mail.com"], ["John", "johnnybravo@mail.com"]]
//  print(sol.accountsMerge(a))

a = [["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe1@m.co"], ["Kevin", "Kevin3@m.co", "Kevin5@m.co", "Kevin0@m.co"], ["Ethan", "Ethan5@m.co", "Ethan4@m.co", "Ethan0@m.co"], ["Hanzo", "Hanzo3@m.co", "Hanzo1@m.co", "Hanzo0@m.co"], ["Fern", "Fern5@m.co", "Fern1@m.co", "Fern0@m.co"]]
//  print(sol.accountsMerge(a))

a = [["Alex", "Alex5@m.co", "Alex4@m.co", "Alex0@m.co"], ["Ethan", "Ethan3@m.co", "Ethan3@m.co", "Ethan0@m.co"], ["Kevin", "Kevin4@m.co", "Kevin2@m.co", "Kevin2@m.co"], ["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe2@m.co"], ["Gabe", "Gabe3@m.co", "Gabe4@m.co", "Gabe2@m.co"]]
print(sol.accountsMerge(a))

a = [["David", "David0@m.co", "David1@m.co"], ["David", "David3@m.co", "David4@m.co"], ["David", "David4@m.co", "David5@m.co"], ["David", "David2@m.co", "David3@m.co"], ["David", "David1@m.co", "David2@m.co"]]
print(sol.accountsMerge(a))
