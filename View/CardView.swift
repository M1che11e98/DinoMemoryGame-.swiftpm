//
//  SwiftUIView.swift
//
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import SwiftUI

struct CardView: View {
    @Binding var card: CardModel
    @State private var cardRotation = 0.0
    @State private var contentRotation = 0.0
    let audioManager: AudioManager = AudioManager.shared
    let endGame: Bool
    let tapCount: Int
    let tap:() -> Void
    var body: some View {
        ZStack {
            if card.flipped {
                Image("\(card.ID)")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
            } else {
                Image("NotFlippedCard")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
                    .overlay(
                        Text("?")
                            .font(.system(size:60))
                            .foregroundColor(.white.opacity(0.8))
                            .shadow(color: .black, radius: 15, x: 20, y: 20)
                            .bold()
                            .padding(.top)
                    )
            }
        }  .frame(maxWidth: 200, maxHeight: 200)
            .padding()
            .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
            .opacity(card.matched ? 0.6 : 1)
            .cornerRadius(10)
            .onTapGesture {
                if !card.flipped && !card.matched && !endGame {
                    if tapCount < 2 {
                        flip()
                        tap()
                    }
                }
            }
            .rotation3DEffect(.degrees(cardRotation), axis: (x: 0, y: 1, z: 0))
            .onChange(of: card.flipped) { newValue in
                if !card.flipped {
                    flipBack()
                }
            }
        
    }
    private func flip() {
        audioManager.play(name: "flipcard-91468")
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            cardRotation += 180
        }
        withAnimation(Animation.linear(duration: 0.003).delay(animationTime / 2)) {
            contentRotation += 180
            card.flipped.toggle()
        }
    }
    
    private func flipBack() {
        audioManager.play(name: "flipcard-91468")
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            cardRotation -= 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation -= 180
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .constant(CardModel(ID: 1)), endGame: false, tapCount: 0) {
            print("tap")
        }
        
    }
}
