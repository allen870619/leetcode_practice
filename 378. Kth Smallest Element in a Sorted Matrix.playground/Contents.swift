class Solution { // Binary Search, awesome!
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var left = matrix[0][0], right = matrix.last!.last!
        var mid = (left + right) / 2
        var tmpK = findValue(matrix, target: mid)
        while left < right{
            if tmpK.count < k{
                left = tmpK.lastNext
            }else{
                right = tmpK.last
            }
            mid = (left + right) / 2
            if (left + right) % 2 != 0{
                mid += 1
            }
            tmpK = findValue(matrix, target: mid)
        }
        return left
    }
    
    private func findValue(_ matrix: [[Int]], target: Int)->(last: Int, lastNext: Int, count: Int){
        var total = 0
        var end = matrix[0][0]
        var endNext = matrix.last!.last!
        let count = matrix.count-1
        var x = 0, y = count
        while x <= count && y >= 0{
            if matrix[y][x] < target{
                end = max(end, matrix[y][x])
                total += y + 1
                x += 1
            }else{
                endNext = min(endNext, matrix[y][x])
                y -= 1
            }
        }
        return (end, endNext, total)
    }
}

class Solution2 {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var tmp = [Int]()
        for i in matrix{
            tmp += i
        }
        tmp.sort()
        return tmp[k-1]
    }
}

let sol = Solution()
print(sol.kthSmallest([[100000000]], 1))
print(sol.kthSmallest([[1,2],[1,3]], 1))
print(sol.kthSmallest([[1,2],[1,3]], 2))
print(sol.kthSmallest([[1,2],[1,3]], 3))
print(sol.kthSmallest([[1,2],[1,3]], 4))
print(sol.kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 8))

print(sol.kthSmallest([[1,2,3],[1,3,5],[1,3,6]], 1))
print(sol.kthSmallest([[1,2,3],[1,3,5],[1,3,6]], 2))
print(sol.kthSmallest([[1,2,3],[1,3,5],[1,3,6]], 3))
print(sol.kthSmallest([[1,2,3],[1,3,5],[1,3,6]], 4))
