class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var ver1Arr = version1.split(separator: ".").compactMap { Int($0) }
        var ver2Arr = version2.split(separator: ".").compactMap { Int($0) }
        let total = max(ver1Arr.count, ver2Arr.count)

        for i in ver1Arr.count ..< total {
            ver1Arr.append(-1)
        }
        for i in ver2Arr.count ..< total {
            ver2Arr.append(-1)
        }

        for i in 0 ..< total {
            if ver1Arr[i] == -1, ver2Arr[i] == -1 {
                return 0
            }
            if ver1Arr[i] == -1, ver2Arr[i] > 0 {
                return -1
            }
            if !(ver1Arr[i] == -1 && ver2Arr[i] == 0), !(ver1Arr[i] == 0 && ver2Arr[i] == -1) {
                if ver1Arr[i] > 0, ver2Arr[i] == -1 {
                    return 1
                }
                if ver1Arr[i] != ver2Arr[i] {
                    return ver1Arr[i] > ver2Arr[i] ? 1 : -1
                }
            }
        }
        return 0
    }
}

let sol = Solution()
print(sol.compareVersion("1.01", "1.001"))
print(sol.compareVersion("1.0", "1.0.0"))
print(sol.compareVersion("0.1", "1.1"))
print(sol.compareVersion("1.2.3", "1.0.0"))
