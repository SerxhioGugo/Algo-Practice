import UIKit

//Binary Search
//Searching through an array to find out if the number is part of that array and if it is than at what index. Note: The array needs to be sorted.

//Making the implementation of this item generic allows us to search for strings or numbers with no hassle.
let arrayOfStrings = ["a","b","c","d"]
let arrayOfNumbers = [1, 3, 5, 12, 37, 43, 66, 69]

//Binary search is recursive in it's own definition as what is needed to be done is to consistently needs to chop the array into smaller arrays

//Above is being used a generic function that conforms to Comparable which means allowing us to compare custom types of values.

func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
    //check if the key exists in the array or not and return nil if not.
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        //find the middle index
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        //Search for the key in the left half
        if array[midIndex] > key {
            return binarySearch(array, key: key, range: range.lowerBound ..< midIndex)
            //check for the key in the right half, and recursively call the function to keep chopping array in half until it finds its last midIndex which is also the index for our chosen key.
        } else if array[midIndex] < key {
            return binarySearch(array, key: key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

//test by filling the parameters of the func with the array, key, and the range.
//All in all the range operator is the key to success in this algorithm.
binarySearch(arrayOfNumbers, key: 69, range: 0..<arrayOfNumbers.count)
