//
//  SwiftUIView.swift
//  
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import SwiftUI

struct DinoRowView: View {
    @AppStorage("userXP") var userXP: Int = 1000
    let item: ItemsModel
    let lockColor = Color.theme.backgroundColorGold
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            if item.score <= userXP {
                imageRow
            } else {
                imageRow
                    .opacity(0.5)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [lockColor, lockColor]), startPoint: .top, endPoint: .bottom)
                            .mask(Image(systemName: "lock.fill"))
                            .font(.system(size: 60))
                    )
            }
            VStack {
                HStack(spacing: 20) {
                    Text("\(item.species)".capitalized)
                    Text("\(item.genus)")
                    Spacer()
                }
                HStack {
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .padding()
                    Text("\(item.score)")
                    Spacer()
                }
            }   .font(.custom("' RonySiswadi Architect 1", size: 30))
                .foregroundColor(.black)
                .padding([.top, .leading])
            
        }   .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
extension DinoRowView {
    private var imageRow: some View {
        Image(item.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .padding()
            .background(.black.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
struct DinoRowView_Previews: PreviewProvider {
    static var previews: some View {
        DinoRowView(item: ItemsModel(id: 1, species: "ANKYLOSAURUS", era: "CRETACEOUS", family: "Ankylosauridae", description: "Famed for its clubbed tail and the armour plates that cover its back, Ankylosaurus is a genus of Ankylosaurus that lived around 70m years ago during the Late Cretaceous period. Ankylosaurus’ protective osteoderms and robust build – the average specimen weighs 8 tonnes and is 9.6m in length - defend it from predators such as Tyrannosaurus rex, while its large stomach digested up to 60kg of ferns and shrubs every day.", description2: "", description3: "", isLocked: false, imageName: "ANKYLOSAURUS", score: 30, genus: "🌱"))
    }
}
