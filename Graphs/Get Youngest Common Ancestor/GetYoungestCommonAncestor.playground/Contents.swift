

class AncestralTree: Hashable {
    var name: String
    var ancestor: AncestralTree?

    init(name: String) {
        self.name = name
        ancestor = nil
    }

    static func == (lhs: AncestralTree, rhs: AncestralTree) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

func getYoungestCommonAncestor(
    _ topAncestor: AncestralTree?,
    _ descendantOne: inout AncestralTree?,
    _ descendantTwo: inout AncestralTree?)
-> AncestralTree {
    var visited = Set<AncestralTree>()
    var stack = [descendantOne, descendantTwo]

    while !stack.isEmpty {
        if let descendant = stack.removeFirst() {

            if !visited.contains(descendant) {
                visited.insert(descendant)
            } else {
                return descendant
            }

            if descendant == topAncestor || descendant.ancestor == topAncestor {
                continue
            } else {
                stack.append(descendant)
            }
        }
    }

    return topAncestor!
}
