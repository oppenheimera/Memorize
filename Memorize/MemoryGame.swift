//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ari Oppenheimer on 8/29/24.
//

import Foundation

struct MemoryGame<CardContent> {
  private(set) var cards: Array<Card>
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []
    // add numberOfPairsOfCards x2
    for pair in 0..<max(2, numberOfPairsOfCards) {
      let content: CardContent = cardContentFactory(pair)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  func choose(card: Card) {
    
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  struct Card {
    var isFaceUp = true
    var isMatched = false
    var content: CardContent
  }
}
