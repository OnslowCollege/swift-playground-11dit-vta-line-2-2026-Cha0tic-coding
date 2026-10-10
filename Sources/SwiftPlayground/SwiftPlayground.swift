// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {

print()
print("Welcome to the Personal Finance Tracker.")
print()

///
var ageLoop = true

//
while ageLoop == false {

    let minAge:Double = 15
    let maxAge:Double = 65
    let youthAge:Double = 20
    var userAge:Double = 0

    print("Please Enter your age:")

    // Collects the age of the the user.
    if let userInputAge = readLine(),
        let age = Double(userInputAge),
        age >= minAge && age < maxAge {
            print("Entered: \(age) years.")
            userAge = age
        } else {
            print("This is not a valid input, please enter a number between \(minAge) - \(maxAge).")
        }


if userAge >= minAge && userAge <= youthAge {
    print("You have been registered as a YOUTH.")
    ageLoop = false
} else if userAge > youthAge && userAge <= maxAge {
    print("You have been registered as an ADULT.")
    ageLoop = false
}
}

/// Starts the Personal Finance Tracker while loop.
var isRunning = true

// Loop until user has finished.
while isRunning == true && invalidInput = false {

    /// Magic numbers for boundaries.
    let noWorkHours:Double = 0
    let maxWorkHours:Double = 20
    let minimumWage = 18.80
    let maximumWage = 23.50
    let minimumCost:Double = 0

    /// Magic numbers for equations.
    var hourlyWage:Double = 0
    var workHoursWeek:Double = 0
    let tax = 0.15

    /// Invalid input boundary
    var invalidInput = false


    print("Enter your total work hours this week:")

    // Collects the ammount of workhours from the user.
    if let userInputHours = readLine(),
        let hours = Double(userInputHours),
        hours >= noWorkHours && hours <= maxWorkHours {
            workHoursWeek = hours
            print("Entered: \(workHoursWeek) hours.")
        } else {
            print("This is not a valid input, please enter a number between \(noWorkHours) - \(maxWorkHours) (youth hours).")
            invalidInput = true
        }

    if invalidInput == false && workHoursWeek != 0 {
        print()
        print("Enter your hourly wage:")

    // Collects the ammount of wage the user.
    if let userInputWage = readLine(),
    let wage = Double(userInputWage),
        wage >= minimumWage && wage <= maximumWage {
            hourlyWage = wage
            print("Entered: $\(hourlyWage)")
        } else {
            print("This is not a valid input, please enter a number between \(minimumWage) - \(maximumWage) (youth wage).")
            print()
            print("Please re-enter your work hours.")
            print()
            invalidInput = true
        }
    }


    /// Calculates total pay and taxxed pay.
    let payBeforeTax = hourlyWage * workHoursWeek
    let taxxedWage = payBeforeTax * tax
    let payAfterTax = payBeforeTax - taxxedWage

    /// Limits pay to 2 dp.
    let rounder:Double = 100
    let tempPayBeforeTax = Int(payBeforeTax * 100)
    let roundedPayBeforeTax = Double(tempPayBeforeTax) / rounder

    let tempTaxxedWage = Int(taxxedWage * 100)
    let roundedTaxxedWage = Double(tempTaxxedWage) / rounder

    let tempPayAfterTax = Int(payAfterTax * 100)
    let roundedPayAfterTax = Double(tempPayAfterTax) / rounder

    // Informs user of wage, tax, total income.
    if invalidInput == false {
        print()
        print("-----------------")
        print("You earned $\(roundedPayBeforeTax) before tax.")
        print("You paid $\(roundedTaxxedWage) in income tax")
        print("You earned $\(roundedPayAfterTax) TOTAL")
        print("-----------------")
        print()
    }

        /// Expense data collectors.
        var userExpenses: [String] = []
        var userExpenseCosts: [Double] = []
        var expenseAmmount = 0
        let nextExpense = 1
        var totalExpense:Double = 0
        var payAfterExpenses: Double = 0

        /// Prepare user info segment.
        var userInfo = false

        /// Starts the expense loop.
        var expenseLoop = true

        /// Loops until user has entered all expenses.
        while expenseLoop == true && invalidInput == false {

            // Collects name of expense.
            print("Enter a Name for your expense:")
            let userInputExpense = readLine()!.lowercased()

            // Adds name of expense to the array.
            userExpenses.append(userInputExpense)
            print("You entered: \(userExpenses[expenseAmmount])")

            print("Enter '\(userExpenses[expenseAmmount])' cost this week:")

            // Collects cost of expense, adds it to cost array and total cost.
            if invalidInput == false {
            if let userInputCostExpense = readLine(),
            let costExpense = Double(userInputCostExpense),
                costExpense >= minimumCost {
                    print("Entered: $\(costExpense)")
                    userExpenseCosts.append(costExpense)
                    totalExpense += costExpense
                } else {
                    print("Invalid response. ")
                    expenseAmmount -= nextExpense
                }
            }

            print()
            print("Add another expense? (Y/N)")

            /// Checks if user wants another expense.
            let anotherExpense = readLine()?.uppercased()

            // Informs the user whether or not they want another expense.
            if anotherExpense == "Y" {
                print("Entered: 'Y'")
                print()
                print("Proceeding to next expense")
                print()
                expenseAmmount += nextExpense
            } else if anotherExpense == "N" {
                print("Entered: 'N'")
                print()
                print("Proceeding to total paycheck")
                print()
                expenseLoop = false
                userInfo = true
            } else {
                print("This is an invalid input, please try again.")
                invalidInput = true
                expenseLoop = true
            }
        }

    // Loop until user has been given the information.
    if userInfo == true && invalidInput == false {

        /// Start expense list loop.
        var listExpenseLoop = true

        /// Index to substitute for.each.
        var expenseList = 0

        /// Round totalExpense to 2 dp.
        let tempTotalExpense = Int(totalExpense * 100)
        let roundedTotalExpense = Double(tempTotalExpense) / rounder

        print()
        print("Your total income was: $\(roundedPayAfterTax)")
        print("---------")
        print("Your total expense cost was: $\(roundedTotalExpense)")

        // While loop to list all expenses.
        while listExpenseLoop == true {
            if expenseList <= expenseAmmount {
                print("- $\(userExpenseCosts[expenseList]) for \(userExpenses[expenseList])")
                expenseList += nextExpense
            } else {
                print("---------")
                listExpenseLoop = false
            }
        }

        /// Calculates the users total money after expenses.
        payAfterExpenses = roundedPayAfterTax - roundedTotalExpense

        // Informs the user whether or not they can afford the expenses
        if totalExpense <= payAfterTax {
            print("\(roundedPayAfterTax) - \(roundedTotalExpense) = \(payAfterExpenses)")
            print("= $\(payAfterExpenses) Remaining")
            print("You can afford your expenses this week.")
        } else {
            payAfterExpenses *= -1
            print("\(roundedPayAfterTax) - \(roundedTotalExpense) = -\(payAfterExpenses)")
            print("= -$\(payAfterExpenses) Remaining")
            print("You CANNOT afford your expenses this week.")
        }
    }

        if invalidInput == false {
            print()
            print("Would you like to start another week? (Y/N)")

            /// Collects answer for next week.
            let anotherWeek = readLine()?.uppercased()

            // Informs the user of the answer they chose.
            if anotherWeek == "Y" {
                print("Entered: 'Y'")
                print()
                print("Beginning next week...")
                print()
            } else if anotherWeek == "N" {
                print("Entered: 'N'")
                print("Ending: 'the Personal Finance Tracker.'")
                isRunning = false
            } else {
                print("This is an invalid input.")
                print("Ending: 'the Personal Finance Tracker.'")
                isRunning = false
            }
        }

    /// End of isRunning loop.
    }

    }
}