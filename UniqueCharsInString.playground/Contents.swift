import UIKit

//Find out if the word hold only unique values (characters).

//Examples
var abc = "abc"
var abba = "abba"

func isUnique(word: String) -> Bool {
    var isUnique = false
    
    //Slice word into array of chars
    let chars = Array(word)
    
    //Create a dictionary to keep count of how many times the value is repeated
    var countCharDict = [Character:Int]()
    
    //Get hold of each char and assign count
    for char in chars {
        if let count = countCharDict[char] {
            countCharDict[char] = count + 1
        } else {
            countCharDict[char] = 1
        }
    }
    
    //Access the count and check if is less then 1, if it is, the word has unique values.
    //If count is more then 1, the word does not have unique values
    for key in countCharDict.keys {
        if let count = countCharDict[key] {
            if count > 1 {
                isUnique = false
            } else {
                isUnique = true
            }
        }
    }
    
    return isUnique
}

print(isUnique(word: abc))
