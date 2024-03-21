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

func introMessage() {
  print();
  print("Welcome to The Letter Checking Program!");
  print();
  print("To use this program, you must first enter how many", terminator: "");
  print("letters you want to check. If you input erroneous ");
  print("data, it will count as a letter so be careful!", terminator: "");
  print("Then, you must enter one letter (only one at a time). ");
  print("The program will tell you if it is a capital,", terminator: "");
  print("or lowercase letter, and if it is a vowel or a ");
  print("consonant. To end the program, enter an asterisk ", terminator: "");
  print("instead of a letter when prompted.");
  print();
}

// main part of program
introMessage()

do {
  // Getting user input for amount of letters
  let numLetters = try userInputNumLetters()

  // Loops according to amount of letters
  for _ in 0..<numLetters {
    // Gets user input for letter
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
      print("Please enter only one character.")
    }
  }

// User entered invalid amount of letters
} catch InputError.invalidInput {
  print("That is not a valid amount of letters.")

// Catch any other error
} catch {
  print("Error")
}

// Exit message
print("Thank you for using The Letter Checking Program!")
