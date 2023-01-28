//
//  Dice.swift
//  RollIt
//
//  Created by Bror2 on 26/01/2023.
//

import Foundation

class Dice: Identifiable {
    let id = UUID()
    var value: Int
    
    init() {
        self.value = Int.random(in: 1...2)
    }
    
    func generateRandomInt(range: ClosedRange<Int> = 1...2) {
        self.value = Int.random(in: range)
    }
}
