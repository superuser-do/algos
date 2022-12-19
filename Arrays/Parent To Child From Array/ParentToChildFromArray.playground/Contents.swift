

func parentToChild(_ relations: [[String]]) -> String {
    guard !relations.isEmpty, !relations[0].isEmpty else {
        return "No family relations"
    }

    var parentToChildren = [String: [String]]()
    for relation in relations {
        let child = relation[0]
        mapToParent(relation[1], child, &parentToChildren)
        mapToParent(relation[2], child, &parentToChildren)
    }

    var parentRelationships = [String]()
    for (parent, child) in parentToChildren {
        parentRelationships.append("\(parent) is the parent of \(child.joined(separator: ", "))")
    }
    return parentRelationships.joined(separator: "\n")
}

func mapToParent(_ parent: String, _ child: String, _ parentToChild: inout [String: [String]]) {
    if parentToChild.keys.contains(parent) {
        parentToChild[parent]?.append(child)
    } else {
        parentToChild[parent] = [child]
    }
}

parentToChild([
    ["James", "Ben", "Lisa"],
    ["George", "Taylor", "Fred"],
    ["Jen", "Ben", "Gloria"]
  ])
