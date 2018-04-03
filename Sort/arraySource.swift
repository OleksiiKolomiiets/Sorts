//
//  arraySource.swift
//  Sort
//
//  Created by Oleksii Kolomiiets on 4/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation


func generateArray(of capasity: Int) -> [Int] {
    var generatedArray: [Int] = []
    
    for _ in 0..<capasity {
        generatedArray.append(capasity.arc4random)
    }
    
    return generatedArray
}



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
