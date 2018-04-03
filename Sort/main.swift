//
//  main.swift
//  Sort
//
//  Created by Oleksii Kolomiiets on 4/2/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation



var numbers = [1, 9, 18, 7, 11, 12, 13, 14, 4, 3, 2, 1, 22, 23, 21, 7]
//
//func insertSort(_ array: [Int]) -> [Int] {
//    var result = array
//    for index1 in 0..<result.count {
//        if index1 != 0 && result[index1] < result[index1 - 1] {
//            result.swapAt(index1, index1 - 1)
//            for index2 in (0..<index1).reversed() {
//                if index2 != 0, result[index2] < result[index2 - 1] {
//                    result.swapAt(index2, index2 - 1)
//                }
//            }
//        }
//    }
//    return result
//}

func insertSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

func selection(_ array: [Int]) -> [Int] {
    var copy = array
    var minIndex = 0
    
    for index1 in 0..<copy.count {
        minIndex = index1
        for index2 in index1..<copy.count {
            if copy[minIndex] > copy[index2] {
                minIndex = index2
            }
        }
        copy.swapAt(index1, minIndex)
    }
    return copy
}

func buble(_ array: [Int]) -> [Int] {
    var copy = array
    for index1 in (0..<copy.count).reversed() {
        for index2 in 0..<index1 {
            if copy[index2] > copy[index2 + 1] {
                copy.swapAt(index2, index2 + 1)
            }
        }
    }
    return copy
}

//func quickSort(_ array: [Int]) -> [Int] {
//    var copy = array
//    for index in (0..<copy.count).reversed() {
//        for index1 in 0...index {
//            if index1 != 0, copy[index1] > copy[index] {
//                if (index - 1 == index1) {
//                    copy.swapAt(index, index - 1)
//                } else {
//                    copy.swapAt(index, index - 1)
//                    copy.swapAt(index, index1)
//                }
//                break
//            }
//            if index1 == 0, copy[index1] > copy[index] {
//                copy.swapAt(index, index1)
//                break
//            }
//
//        }
//    }
//
//    for index3 in 0..<copy.count - 1 {
//        if copy[index3] > copy[index3 + 1] {
//            copy = quickSort(copy)
//        }
//    }
//    return copy
//}
func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile: [T] = []
    if orderedPile.capacity < leftPile.count + rightPile.count {
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    }
    
    while true {
        guard leftIndex < leftPile.endIndex else {
            orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
            break
        }
        guard rightIndex < rightPile.endIndex else {
            orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
            break
        }
        
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    
    return orderedPile
}

var approach:SortMethods = .insertSort
let capacity = 32000
let precision = 10000.0
var work = true
while work {
    switch approach {
    case .insertSort:
        print("-------------------------------------------")
        print("Insert Sort")
        resultPrint(capacity: capacity, approach: approach)
        approach = .buble
    case .buble:
        print("Buble sort")
        resultPrint(capacity: capacity, approach: approach)
        approach = .selection
    case .selection:
        print("Selection sort")
        resultPrint(capacity: capacity, approach: approach)
        approach = .quickSort
    case .quickSort:
        print("Quick Sort sort")
        resultPrint(capacity: capacity, approach: approach)
        approach = .merge
    case .merge:
        print("Merge Sort sort")
        resultPrint(capacity: capacity, approach: approach)
        work = false
    }
}
//print("""
//    insertSort:\t \(insertSort(array: numbers))
//    quickSort:\t \(quickSort(array: numbers))
//    selection:\t \(selection(array: numbers))
//    buble:\t\t \(buble(array: numbers))
//    merge:\t\t \(mergeSort(numbers))
//    """)

