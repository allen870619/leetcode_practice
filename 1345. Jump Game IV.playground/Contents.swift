class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        if arr.count == 1{
            return 0
        }
        
        // arr preprocess, create graph
        var dict: [Int: [Int]] = [:]
        for i in 0..<arr.count{
            if dict[arr[i]] == nil{
                dict[arr[i]] = [i]
            }else{
                dict[arr[i]]!.append(i)
            }
        }
        
        // cal
        var result = 0
        var alreadyFind = Array(repeating: false, count: arr.count)
        var queue: [Int] = [0]
        while !queue.isEmpty{
            for _ in 0..<queue.count{
                let cur = queue.removeFirst()
                if cur == arr.count - 1{ // match
                    return result
                }
                
                // a[i] == a[j]
                for i in dict[arr[cur]]!{
                    if arr[i] == arr[cur] && i != cur && !alreadyFind[i]{
                        queue.append(i)
                        alreadyFind[i] = true
                    }
                }
                dict[arr[cur]]?.removeAll()
                
                // prev
                if cur > 0 && !alreadyFind[cur - 1]{
                    queue.append(cur - 1)
                    alreadyFind[cur-1] = true
                }
                
                // next
                if cur < arr.count - 1 && !alreadyFind[cur + 1]{
                    queue.append(cur + 1)
                    alreadyFind[cur+1] = true
                }
            }
            result += 1
        }
        return result
    }
}

class Solution2 { // may TLE
    func minJumps(_ a: [Int]) -> Int {
        if a.count == 1{
            return 0
        }
        
        // arr preprocess, remove duplicate, leave only two words
        var arr: [Int] = [a[0]]
        var last = Int.min
        var lastCount = 0
        for i in a[1..<a.count-1]{
            if i != last{
                if lastCount > 1{
                    arr.append(last)
                }
                lastCount = 0
                last = i
                arr.append(i)
            }else{
                lastCount += 1
            }
        }
        if lastCount > 1{
            arr.append(last)
        }
        arr.append(a.last!)
        
        var result = 0
        var alreadyFind = Array(repeating: 0, count: arr.count)
        var dict: [Int: [Int]] = [:]
        var finded: [Int] = [0]
        while !finded.isEmpty{
            for _ in 0..<finded.count{
                let cur = finded.remove(at: 0)
                if cur == arr.count - 1{ // match
                    return result
                }
                
                // a[i] == a[j]
                for i in 0..<arr.count{
                    if arr[i] == arr[cur] && i != cur && alreadyFind[i] == 0{
                        finded.append(i)
                        alreadyFind[i] = 1
                    }
                }
                
                    // prev
                    if cur > 0 && alreadyFind[cur - 1] == 0{
                        finded.append(cur - 1)
                        alreadyFind[cur-1] = 1
                    }
                    
                    // next
                    if cur < arr.count - 1 && alreadyFind[cur + 1] == 0{
                        finded.append(cur + 1)
                        alreadyFind[cur+1] = 1
                    }
            }
            result += 1
        }
        return result
    }
}

let sol = Solution()
print(sol.minJumps([100,-23,-23,404,100,23,23,23,3,404])) //3
print(sol.minJumps([7])) // 0
print(sol.minJumps([7,6,9,6,9,6,9,7])) // 1
print(sol.minJumps([68,-94,-44,-18,-1,18,-87,29,-6,-87,-27,37,-57,7,18,68,-59,29,7,53,-27,-59,18,-1,18,-18,-59,-1,-18,-84,-20,7,7,-87,-18,-84,-20,-27]))
print(sol.minJumps([7,7,7,7,7,7,7,7,7,1,1,1,1,1,11]))
