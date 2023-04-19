//
//  SwiftUIView.swift
//  
//
//  Created by Marta Michelle Caliendo on 14/04/23.
//

import SwiftUI

struct EndMemoryGameView: View {
    @ObservedObject var vm: MemoryBoardData
    var body: some View {
        VStack {
            if vm.fetchAllFlippedCards() && vm.seconds != 0 {
                HStack {
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .font(.system(size: 32))
                        .shadow(radius: 3, x: 2, y: 2)
                    Text("\(vm.userXP)")
                        .font(.custom("Dinosaur", size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 5, x: 5, y: 5)
                } .padding()
                Text("🥳")
                    .font(.system(size: 80))

                    .padding()
                Text("Congratulations, you win!")
                    .font(.custom("Dinosaur", size: 35))
                    .foregroundColor(.theme.rowColorGreen2)
                    .padding()
            } else {
                Text("☹️")
                    .font(.system(size: 80))
                    .padding()
                Text("Game over.")
                    .font(.custom("Dinosaur", size: 40))
                    .foregroundColor(.theme.rowColorGreen2)
                Button {
                    vm.createSetCard()
                } label: {
                   Image("TryAgainButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .shadow(radius: 10)
                }
            }
            
        }
        .foregroundColor(.black)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .stroke(vm.fetchAllFlippedCards() && vm.seconds != 0 ? Color.theme.strokeColor : .red, lineWidth: 10)
                .opacity(0.5)
                .frame(width: 700, height: 400)
                .background(
                    .regularMaterial,
                    in: RoundedRectangle(cornerRadius: 40)
                )
            
        ) .shadow(radius: 10)
     
    }
}

struct EndMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndMemoryGameView(vm: MemoryBoardData())
    }
}
