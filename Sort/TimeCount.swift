//
//  TimeCount.swift
//  Sort
//
//  Created by Oleksii Kolomiiets on 4/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

func timeCountForSortArray(capacity: Int, method: SortMethods, arrayType: ArrayType) -> Double {
    var arrayForSort = [Int]()
    switch arrayType {
    case .ascending:
        arrayForSort = mergeSort(generateArray(of: capacity))
    case .descending:
        arrayForSort = Array(mergeSort(generateArray(of: capacity)).reversed())
    case .random:
        arrayForSort = generateArray(of: capacity)
    }
    var counter = 0
    let iterations = 1
    
    switch method {
    case .insertSort:
        let cuurentDate = Date()
        while counter != iterations {
            sort(by: method, arrayForSort)
            counter += 1
        }
        return -(cuurentDate.timeIntervalSinceNow/Double(iterations))
    case .quickSort:
        let cuurentDate = Date()
        while counter != iterations {
            sort(by: method, arrayForSort)
            counter += 1
        }
        return -(cuurentDate.timeIntervalSinceNow/Double(iterations))
    case .selection:
        let cuurentDate = Date()
        while counter != iterations {
            sort(by: method, arrayForSort)
            counter += 1
        }
        return -(cuurentDate.timeIntervalSinceNow/Double(iterations))
    case .buble:
        let cuurentDate = Date()
        while counter != iterations {
            sort(by: method, arrayForSort)
            counter += 1
        }
        return -(cuurentDate.timeIntervalSinceNow/Double(iterations))
    case .merge:
        let cuurentDate = Date()
        while counter != iterations {
            sort(by: method, arrayForSort)
            counter += 1
        }
        return -(cuurentDate.timeIntervalSinceNow/Double(iterations))
        
    }
   
   
}
