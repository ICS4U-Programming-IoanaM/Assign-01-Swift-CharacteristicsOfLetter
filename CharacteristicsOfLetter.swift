// Function to get user input and return a character
func userInput() -> Character? {
    print("Enter a letter: ")
    guard let input = readLine(), let char = Array(input) {
        return nil
    }
    return char
}

if let input = userInput() {
    print(input)
} else {
    print("No input provided.")
}