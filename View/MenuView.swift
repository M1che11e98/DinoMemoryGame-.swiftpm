//
//  SwiftUIView.swift
//  
//
//  Created by Marta Michelle Caliendo on 16/04/23.
//

import SwiftUI

struct MenuView: View {
    let backgroundColor: Color = Color.theme.backgroundColorBlue
    let backgroundColor2: Color = Color.theme.rowColorGreen
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("DinoImageBrown")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top, 900)
                    .padding(.leading, 580)
                    .shadow(color: .black.opacity(0.65), radius: 10, x: 10, y: 10)
                VStack(spacing: 50) {
                    NavigationLink {
                        MemoryBoardView()
                    } label: {
                        ShapeView(text: "Memory Game")
                    } .padding()
                    NavigationLink {
                        DinoLibraryView()
                    } label: {
                        ShapeView(text: "Library")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .background(
                LinearGradient(colors: [backgroundColor,backgroundColor2], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            )
            .overlay {
                Image("DinoImageBlue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 900)
                    .padding(.trailing, 580)
                    .shadow(color: .black.opacity(0.65), radius: 10, x: 10, y: 10)
            }
        }
    }
}
struct ShapeView: View {
    let text: String
    var body: some View {
        VStack {
            Text(text)
                .frame(width: 700, height: 270)
                .font(.custom("Dinosaur", size: 60))
                .foregroundColor(.theme.rowColorGreen2)
                .background(
                    .regularMaterial,
                    in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                ) .shadow(radius: 20, x: -20, y: 20)
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
