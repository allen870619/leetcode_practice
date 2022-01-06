class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for i in trips{
            var cap = i[0]
            for j in i[1]..<i[2]{
                if dict[j] != nil{
                    dict[j]! += cap
                }else{
                    dict[j] = cap
                }
            }
        }
        
        for i in dict{
            if i.value > capacity{
                return false
            }
        }
        return true
    }
}

class Solution2 {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for i in trips{
            var cap = i[0]
            if dict[i[1]] != nil{
                dict[i[1]]! += cap
            }else{
                dict[i[1]] = cap
            }
            
            if dict[i[2]] != nil{
                dict[i[2]]! -= cap
            }else{
                dict[i[2]] = -cap
            }
        }
        
        var car = 0
        for i in dict.sorted(by: {$0.key < $1.key}){
            car += i.value
            if car > capacity{
                return false
            }
        }
        return true
    }
}

class Solution3 {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var dict = Array(repeating: 0, count: 1001)
        for i in trips{
            var cap = i[0]
            dict[i[1]] += cap
            dict[i[2]] -= cap
        }
        
        var car = 0
        for i in dict{
            car += i
            if car > capacity{
                return false
            }
        }
        return true
    }
}

let sol = Solution2()
print(sol.carPooling([[2,1,5],[3,3,7]], 4)) // f
print(sol.carPooling([[2,1,5],[3,3,7]], 5)) // t
print(sol.carPooling([[2,1,5],[3,5,7]], 3)) // t
print(sol.carPooling([[1,1,4],[9,4,9],[9,1,9],[2,3,5],[4,1,5],[10,4,5]], 33)) // f

