

func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
    var maxCustomers = 0

    var rollingSum = 0
    for (customer, isGrumpy) in zip(customers, grumpy) {
        if isGrumpy == 0 {
            rollingSum += customer
        }
    }

    for min in 0..<minutes {
        if grumpy[min] == 1 {
            rollingSum += customers[min]
        }
    }

    maxCustomers = rollingSum

    var i = 0, j = minutes
    while j < customers.count {
        if grumpy[j] == 1 {
            rollingSum += customers[j]
        }

        if grumpy[i] == 1 {
            rollingSum -= customers[i]
        }

        maxCustomers = max(maxCustomers, rollingSum)
        i += 1
        j += 1
    }

    return maxCustomers
}
maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3)
