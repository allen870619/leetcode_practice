class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for i in paths {
            let list = i.split(separator: " ")
            let path = "\(list[0])"
            for rawName in list[1...] {
                let name = [Character](rawName)
                if let start = name.firstIndex(of: "(") {
                    let fileName = String(name[start + 1 ..< name.count - 1])
                    dict[fileName, default: []].append("\(path)/\(String(name[0 ..< start]))")
                }
            }
        }
        var result = [[String]]()
        for i in dict {
            if i.value.count > 1 {
                result.append(i.value)
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.findDuplicate(["root/a 1.txt(abcd) 2.txt(efgh)", "root/c 3.txt(abcd)", "root/c/d 4.txt(efgh)", "root 4.txt(efgh)"]))
