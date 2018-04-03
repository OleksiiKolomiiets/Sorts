//
//  Result.swift
//  Sort
//
//  Created by Oleksii Kolomiiets on 4/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

func resultPrint(capacity: Int, approach: SortMethods) {
    
    var result = timeCountForSortArray(capacity: capacity, method: approach, arrayType: ArrayType.random)
    print("Rand\tfor \t\(capacity)el. takes: \t\(round(precision*result)/precision) sec.")
    
    result = timeCountForSortArray(capacity: capacity, method: approach, arrayType: ArrayType.ascending)
    print("Asc \tfor \t\(capacity)el. takes: \t\(round(precision*result)/precision) sec.")
    
    result = timeCountForSortArray(capacity: capacity, method: approach, arrayType: ArrayType.descending)
    print("Desc\tfor \t\(capacity)el. takes: \t\(round(precision*result)/precision) sec.")
    
    print("-------------------------------------------")
}
