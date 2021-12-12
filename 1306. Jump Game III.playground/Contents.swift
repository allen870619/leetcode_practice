class Solution {
    var searched: [Int] = []
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        searched.removeAll()
        return getData(arr,index: start)
    }
    
    private func getData(_ arr: [Int], index: Int)-> Bool{
        if searched.contains(index) || index >= arr.count || index < 0{
            return false
        }
        searched.append(index)
        
        if arr[index] == 0{
            return true
        }else{
            return getData(arr, index: index + arr[index]) || getData(arr, index: index - arr[index])
        }
    }
}


class Solution2 { // Breadth-First Search
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arr = arr
        var searched: [Int] = []
        searched.append(start)
        
        while !searched.isEmpty{
            let poll = searched.removeFirst()
            if arr[poll] == 0{
                return true
            }
            
            if arr[poll] > 0{
                let rightIndex = poll + arr[poll]
                let leftIndex = poll - arr[poll]
                if rightIndex < arr.count && arr[rightIndex] >= 0{
                    searched.append(poll + arr[poll])
                }
                if leftIndex >= 0 && arr[leftIndex] >= 0{
                    searched.append(poll - arr[poll])
                }
                arr[poll] = -1
            }
        }
        return false
    }
}

class Solution3 { // Depth First Search
    var searched: [Int] = []
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        searched = arr
        return getData(start)
    }
    
    private func getData(_ index: Int)-> Bool{
        if index >= searched.count || index < 0{
            return false
        }
        if searched[index] == -1{
            return false
        }
        
        if searched[index] == 0{
            return true
        }else{
            var shift = searched[index]
            searched[index] = -1
            return getData(index + shift) || getData(index - shift)
        }
    }
}

let sol = Solution3()
print(sol.canReach( [4,2,3,0,3,1,2], 5))
print(sol.canReach( [4,2,3,0,3,1,2], 0))
print(sol.canReach( [3,0,2,1,2], 2))
