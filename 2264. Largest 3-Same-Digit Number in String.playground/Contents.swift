class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var list = [String]()
        var last = Character(" ")
        var count = 0
        for i in num {
            if i == last {
                count += 1
                if count == 3 {
                    list.append("\(i)\(i)\(i)")
                }
            } else {
                last = i
                count = 1
            }
        }
        list.sort(by: { Int($0)! < Int($1)! })

        return list.last != nil ? list.last! : ""
    }
}

let sol = Solution()
print(sol.largestGoodInteger("6777133339"))
print(sol.largestGoodInteger("2300019"))
print(sol.largestGoodInteger("42352338"))
