//
//  Concentration.swift
//  ConcentrationTest
//
//  Created by Navneet Babra on 5/27/18.
//  Copyright © 2018 Navneet Babra. All rights reserved.
//

/**
 Model
 **/

import Foundation

class Concentration {

    var cards = [Card]()

    init(numberOfPairofCards: Int) {
        for _ in 0..<numberOfPairofCards {
            let card = Card()
            //cards.append(card)
            //cards.append(card) ////Since struct is value type -- so a copy
            //Same as above
            cards += [card, card]
        }

        print("Shuffling cards")
        for i in cards.indices {
            let randomNumber =  Int(arc4random_uniform(UInt32(cards.count)))
            print("i is: \(i) and random number is: \(randomNumber)")
            let temp =  cards[i]
            cards[i] = cards[randomNumber]
            cards[randomNumber] = temp
        }

    }

    var indexOfOnlyOneFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneFaceUpCard = nil
            } else {
                //No cards or 2 cards are face up ie. it's the third card
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneFaceUpCard = index
            }
        }
    }
}
