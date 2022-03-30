class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var searchCol = matrix.count - 1
        if searchCol < 1{
            return matrix[searchCol].contains(target)
        }
        for i in 1...searchCol{
            if matrix[i][0] > target{
                searchCol = i - 1
                break
            }
        }
        return matrix[searchCol].contains(target)
    }
}

class Solution2 { // binary search, better
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let col = binSearch(matrix, target)
        let row = binSearch(matrix, target, col)
        return matrix[col][row] == target
    }
    
    private func binSearch(_ matrix: [[Int]], _ target: Int, _ defineCol: Int = -1) -> Int{
        let isCol = defineCol == -1
        var left = 0
        var right = isCol ? matrix.count - 1 : matrix.first!.count - 1
        while left < right{
            let mid = (left + right) / 2 + 1
            if isCol{
                if matrix[mid][0] > target{
                    right = mid - 1
                }else{
                    left = mid
                }
            }else{
                if matrix[defineCol][mid] > target{
                    right = mid - 1
                }else{
                    left = mid
                }
            }
        }
        return left
    }
}

let sol = Solution2()
//print(sol.searchMatrix([[1],[3]], 1))
print(sol.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))


