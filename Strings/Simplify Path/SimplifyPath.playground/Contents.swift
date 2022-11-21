

func simplifyPath(_ path: String) -> String {
    guard !path.isEmpty else { return "" }

    let components = path.split(separator: "/")
    var stack = [String]()
    for component in components {
        switch component {
        case ".":
            break
        case "..":
            if !stack.isEmpty {
                stack.removeLast()
            }
        default:
            stack.append(String(component))
        }
    }

    return "/\(stack.joined(separator: "/"))"
}

simplifyPath("/home/")
simplifyPath("/../")
simplifyPath("home//foo")
