import Foundation

let function = {
    print("complete")
}

func day10(_ f: @escaping () -> Void, _ n: Int) {

    DispatchQueue.main.asyncAfter(deadline: .now() + Double(n)) {
        f()
    }
}


day10(function, 10)
