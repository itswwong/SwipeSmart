//
//  CardCounter.swift
//  cardappIOS
//
//  Created by William Wong on 9/17/23.
//

import Foundation

class CardCounter: ObservableObject {
    var counter: Int
    
    init() {
        self.counter = 0
    }
    
    func increment() -> Int {
        counter += 1
        return counter
    }
}
