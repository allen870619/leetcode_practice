class Solution {
    func simplifyPath(_ path: String) -> String {
        let path = "\(path)/"
        var folder = [String]()
        var tmpFolder = ""
        for i in path{
            if i == "/"{
                if tmpFolder == ".."{
                    folder.popLast()
                }else if !tmpFolder.isEmpty && tmpFolder != "."{
                    folder.append(tmpFolder)
                }
                tmpFolder = ""
            }else{
                tmpFolder.append(i)
            }
        }
        
        return folder.reduce(folder.isEmpty ? "/" : "", { $0 + "/\($1)" })
    }
}

let sol = Solution()
print(sol.simplifyPath("/home/"))
print(sol.simplifyPath("/../"))
print(sol.simplifyPath("/home//foo/"))
print(sol.simplifyPath("/home/.asdas/a..a"))
print(sol.simplifyPath("/home/../a..a"))
print(sol.simplifyPath("/a/./b/../../c/"))
