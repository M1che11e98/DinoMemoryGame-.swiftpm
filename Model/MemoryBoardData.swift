//
//  File.swift
//
//
//  Created by Marta Michelle Caliendo on 14/04/23.
//

import SwiftUI

class MemoryBoardData: ObservableObject {
    @AppStorage("userXP") var userXP: Int = 1000
    @Published var cards: [CardModel] = []
    @Published var seconds: Int = 60
    @Published var showView: Bool = false
    @Published var tapCount = 0
    @Published var goBack: Bool = false
    private var timer: Timer?
    private let audioManager: AudioManager = AudioManager.shared
    
    func createSetCard() {
        startGame()
        
        let pairs = (4 * 3) / 2
        var sortedCards: [CardModel] = []
        for id in 1...pairs {
            var newId = id
            if id > 10  {
                newId = id-10
            }
            sortedCards.append(CardModel(ID: newId))
            sortedCards.append(CardModel(ID: newId))
        }
        cards = sortedCards.shuffled()
        
    }
    
    func checkCard(currentCard: Int) {
        tapCount += 1
        if let matchedCard = cards.firstIndex(where: { card in
            return card.ID == cards[currentCard].ID && card.id != cards[currentCard].id && card.flipped
        }) {
            audioManager.play(name: "positive-response-81640")
            cards[currentCard].matched = true
            cards[matchedCard].matched = true
            tapCount = 0
            if fetchAllFlippedCards() {
                endGame()
                let finalUserXp = userXP + 999
                Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
                    if self.userXP <= finalUserXp {
                        self.userXP  += 1
                    } else {
                        timer.invalidate()
                        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                            
                            self.goBack.toggle()
                            
                            timer.invalidate()
                        }
                    }
                }
            }
            
        } else if tapCount == 2 {
            if let card = cards.firstIndex(where: { card in
                return card.flipped && !card.matched && card.id != cards[currentCard].id
            }) {
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                    withAnimation(Animation.linear(duration: 0.003).delay(0.5 / 2)) {
                        self.cards[currentCard].flipped = false
                        self.cards[card].flipped = false
                        self.cards[currentCard].matched = false
                        self.cards[card].matched = false
                    }
                    
                    self.tapCount = 0
                    timer.invalidate()
                    
                }
                
            }
        }
    }
    
    func startGame() {
        showView = false
        seconds = 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.seconds -= 1
            if self.seconds == 0 {
                self.endGame()
            }
        }
    }
 
    func fetchAllFlippedCards() -> Bool {
        let cards = cards.filter({ $0.flipped == false})
        if cards.isEmpty {
            return true
        }
        else {
            return false
        }
    }
    
    func endGame() {
        self.timer?.invalidate()
        self.timer = nil
        showView.toggle()
        if  fetchAllFlippedCards() && seconds != 0 {
            audioManager.play(name: "success-fanfare-trumpets-6185")
        } else {
            audioManager.play(name: "fail-144746")
        }
    }
}
