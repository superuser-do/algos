

func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var stack = [Int]()

    for asteroid in asteroids {
        if asteroid > 0 {
            stack.append(asteroid)
        } else { // negative
            while let top = stack.last, top > 0, top < abs(asteroid) {
                stack.popLast()
            }
            if let top = stack.last, top == abs(asteroid) {
                stack.popLast()
            } else if stack.isEmpty || stack.last! < 0 { // empty or top < 0
                stack.append(asteroid)
            }
        }
    }

    return stack
}

asteroidCollision([5,10,-5])
asteroidCollision([8,-8])
asteroidCollision([10,2,-5])
