// creates custom errors
enum InputError: Error {
  // invalid input error
  case invalidInput
}

// Function that gets user input and returns it as an array of characters
func userInputLetter() throws -> [Character] {
  // prompts user to enter letter then reads it
  print("Enter a Letter")
  guard let input = readLine() else {
    // invalid input
    throw InputError.invalidInput
  }
  // converts input to char array and returns it
  let charArray = Array(input)
  return charArray
}

func userInputNumLetters() throws -> Int {
  print("Enter amount of letters: ")
  guard let input = readLine(), let numLetters = Int(input) else {
    // invalid input
    throw InputError.invalidInput
  }
  return numLetters
}

// Function that checks if letter is uppercase or lowercase
func lowerOrUpper(letter: Character) -> String {
  // Checks if letter is lowercase
  if letter <= "z" && letter >= "a" {
    return "lowercase."
  
  // Checks if letter is uppercase
  } else if letter <= "Z" && letter >= "A"{
    return "uppercase."
  }

  // Letter not in Alphabet
  return " "
}

// Function that checks if letter is vowel, consonant, or both
func vowelOrConsonant(letter: Character) -> String {
  // Vowel array declaration
  let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

  // Checks if letter is y
  if letter == "y" || letter == "Y" {
    return "both a vowel and a consonant"

  // Checks if letter is vowel
  } else {
    for character in vowels {
      if character == String(letter) {
        return "a vowel"
      }
    }
  }

  // Letter is a consonant
  return "a consonant"
}

// Getting user input
let letterArray = try userInputLetter()

// Checks if user entered one character
if letterArray.count == 1 {
  // Stores chosen letter in variable
  let letter = letterArray[0]

  // calls functions
  let letterCase = lowerOrUpper(letter: letter)
  let letterType = vowelOrConsonant(letter: letter)

  // Checks if letter is upper or lowercase and outputs to consol
  if letterCase != " " {
    print("Your letter is \(letterType) which is \(letterCase)")

  // The character user entered is not in the alphabet
  } else {
    print("Please enter a letter. No other characters accepted.")
  }
  
// User entered too many chars
} else {
  print("Too many characters. Enter only one character.")
}
