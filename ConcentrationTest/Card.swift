//
//  Card.swift
//  ConcentrationTest
//
//  Created by Navneet Babra on 5/27/18.
//  Copyright © 2018 Navneet Babra. All rights reserved.
//

import Foundation

struct Card {
 // Structs have no inheritence
 // Structs are value type and Classes are reference type

    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierFactory = 0

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
