class WordDictionary {
    class TireNode {
        var count = 0
        var value: Character?
        var nextNode: [TireNode] = []
        init(_ value: Character? = nil) {
            self.value = value
        }
    }

    let root = TireNode()

    func addWord(_ word: String) {
        var tmp = root
        for i in word {
            if let index = tmp.nextNode.firstIndex(where: { $0.value == i }) {
                tmp = tmp.nextNode[index]
            } else {
                let newNode = TireNode(i)
                tmp.nextNode.append(newNode)
                tmp = newNode
            }
        }
        tmp.count += 1
    }

    var searchArr: [Character] = []
    func search(_ word: String) -> Bool {
        searchArr = Array(word)
        return searchResult(root, index: 0)
    }

    private func searchResult(_ node: TireNode, index: Int) -> Bool {
        if index == searchArr.count {
            return node.count > 0
        }
        if searchArr[index] == "." {
            for i in node.nextNode {
                if searchResult(i, index: index + 1) {
                    return true
                }
            }
        } else {
            if let newIndex = node.nextNode.firstIndex(where: { $0.value == searchArr[index] }) {
                return searchResult(node.nextNode[newIndex], index: index + 1)
            }
        }
        return false
    }
}

let sol = WordDictionary()
sol.addWord("dog")
sol.addWord("dogs")
sol.addWord("oath")
sol.addWord("pig")
print(sol.search("dog"))
print(sol.search("dig")) // f
print(sol.search("..g"))
print(sol.search("pigs")) // f
print(sol.search("o..h"))
