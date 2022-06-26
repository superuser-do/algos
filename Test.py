class Test:
    def __init__(self, test_name = ""):
        self.total_count = 0
        self.problem_count = 0
        self.total_score = 0
        self.problem_score = 0
        self.current_problem = ""
        self.failed_problems = []
        print(f"Beginning Test: {test_name}")
        
    # Test Helpers
    def test(self, expected_outcome, outcome, case_num = 0):
        if expected_outcome == outcome:
            return self.passed(case_num)
        return self.failed(case_num)  

    def testMultipleCases(self, possible_outcomes, outcome, case_num = 0):
        for possible_outcome in possible_outcomes:
            if possible_outcome == outcome:
                return self.passed(case_num)
        return self.failed(case_num)

    def testMatchAny(self, expected_outcome, outcome, case_num = 0):
        if self.isEqual(expected_outcome, outcome):
            return self.passed(case_num)
        return self.failed(case_num)        

    def isEqual(self, array1, array2) -> bool:
        for a1 in array1:
            a1.sort()
        sortedArray1 = sorted(array1)
        for a2 in array2:
            a2.sort()
        sortedArray2 = sorted(array2)
        return sortedArray1 == sortedArray2 
    
    # Test Logistics
    def startProblem(self, problemName):
        self.current_problem = problemName
        self.problem_score = 0
        self.problem_count = 0
        self.failed_problems = []
    def passed(self, case_num):
        self.total_score += 1
        self.problem_score += 1
        self.problem_count += 1
        self.total_count += 1
    def failed(self, case_num): 
        self.problem_count += 1
        self.total_count += 1
        self.failed_problems.append(case_num)

    def endProblem(self):
        print(f"\n   {self.current_problem} Score: {self.problem_score} / {self.problem_count}")
        if len(self.failed_problems) > 0:
            print(f"   ** Failed Test Cases: {self.failed_problems}")
    def printFinal(self):
        print(f"\nTotal Score: {self.total_score} / {self.total_count}")