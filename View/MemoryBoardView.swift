//
//  SwiftUIView.swift
//
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import SwiftUI

struct MemoryBoardView: View {
    @StateObject var vm: MemoryBoardData = MemoryBoardData()
    @Environment(\.dismiss) private var dismiss
    let backgroundColor: Color = Color.theme.backgroundColorGreen
    let backgroundColor2: Color = Color.theme.backgroundColorPurple
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "star.fill")
                    .renderingMode(.original)
                    .font(.system(size: 32))
                Text("\(vm.userXP)")
                    .font(.custom("Dinosaur", size: 30))
                    .foregroundColor(.white)
                    .padding()
            }      .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
            Text("\(vm.seconds.description)")
                .font(.custom("Dinosaur", size: 30))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 6, x: 5, y: 5)
            if !vm.cards.isEmpty {
                ForEach(0..<4, id: \.self) { row in
                    HStack {
                        ForEach(0..<3, id: \.self) { column in
                            CardView(card: $vm.cards[row * 3 + column], endGame: vm.showView, tapCount: vm.tapCount, tap: {
                                    vm.checkCard(currentCard: row * 3 + column)
                            })
                        }
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(colors: [backgroundColor, backgroundColor2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        .overlay(alignment: .center, content: {
            if vm.showView {
                EndMemoryGameView(vm: vm)
            }
        })
        .onAppear(perform: {
            vm.createSetCard()
        })
        .onChange(of: vm.goBack) { newValue in
            dismiss()
        }
    }
}

struct MemoryBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBoardView()
    }
}
