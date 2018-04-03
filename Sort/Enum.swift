//
//  Enum.swift
//  Sort
//
//  Created by Oleksii Kolomiiets on 4/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation


enum SortMethods {
    case insertSort
    case quickSort
    case selection
    case buble
    case merge
}

enum ArrayType {
    case ascending
    case descending
    case random
}

func sort(by method: SortMethods, _ array: [Int] ) -> [Int] {
    var result = [Int]()
    switch method {
    case .insertSort:
        result = insertSort(array, <)
    case .quickSort:
        result = quickSort(array)
    case .selection:
        result = selection(array)
    case .buble:
        result = buble(array)
    case .merge:
        result = mergeSort(array)
    }
    return result
}


