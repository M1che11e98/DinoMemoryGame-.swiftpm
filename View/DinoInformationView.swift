//
//  SwiftUIView.swift
//  
//
//  Created by Marta Michelle Caliendo on 16/04/23.
//

import SwiftUI

struct DinoInformationView: View {
    let item: ItemsModel
    let backgroundColor: Color = Color.theme.rowColorGreen
    let backgroundColor2: Color = Color.theme.backgroundColorBlue
    let backgroundColor3: Color = Color.theme.backgroundColorNightBlue
    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black.opacity(0.35))
                .frame(maxWidth: .infinity, maxHeight: 430)
                .padding()
                .overlay {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 400)
                        .shadow(color: .black.opacity(0.5), radius: 7, x: 20, y: 20)
                    .padding() }
            descriptionView
            symbolView
            Spacer()
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [backgroundColor2, backgroundColor], startPoint: .top, endPoint: .bottom)
            )
    }
}
extension DinoInformationView {
    private var descriptionView: some View {
        VStack {
            HStack {
                Text("Genus".capitalized)
                    .font(.custom("' RonySiswadi Architect 1", size: 42))
                    .foregroundColor(backgroundColor3.opacity(0.8))
                Text("\(item.species)".capitalized)
                    .font(.custom("' RonySiswadi Architect 1", size: 40))
                    .padding()
                Text("\(item.genus)")
                    .font(.system(size: 60))
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Description:")
                        .font(.custom("' RonySiswadi Architect 1", size: 30))
                    Text(item.description)
                        .font(.system(size: 28))
                    Text("Name etymology:")
                        .font(.custom("' RonySiswadi Architect 1", size: 30))
                    Text(item.description2)
                        .font(.system(size: 28))
                    Text("Ecology:")
                        .font(.custom("' RonySiswadi Architect 1", size: 30))
                    Text(item.description3)
                        .font(.system(size: 28))
                }
                .padding()
            }
            
        } .foregroundColor(.black)
    }
}
extension DinoInformationView {
    private var symbolView: some View {
        
        HStack {
            HStack {
                Text("🧬")
                    .font(.system(size: 40))
                    .padding()
                Text("FAMILY".capitalized)
                    .font(.title)
                    .foregroundColor(backgroundColor3.opacity(0.8))
                Text("\(item.family)".capitalized)
                    .font(.title)
            }
            .italic()
            Spacer()
            HStack {
                Text("⏳")
                    .font(.system(size: 40))
                    .padding()
                Text("ERA".capitalized)
                    .font(.title)
                    .foregroundColor(backgroundColor3.opacity(0.8))
                Text("\(item.era)".capitalized)
                    .font(.title)
            }      .italic()
        }
        .foregroundColor(.black)
        .bold()
        .padding(.trailing, 30)
    }
}

struct DinoInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DinoInformationView(item: ItemsModel(id: 1, species: "ANKYLOSAURUS", era: "CRETACEOUS", family: "Ankylosauridae", description: "Famed for its clubbed tail and the armour plates that cover its back, Ankylosaurus is a genus of Ankylosaurus that lived around 70m years ago during the Late Cretaceous period. Ankylosaurus’ protective osteoderms and robust build – the average specimen weighs 8 tonnes and is 9.6m in length - defend it from predators such as Tyrannosaurus rex, while its large stomach digested up to 60kg of ferns and shrubs every day.", description2: "", description3: "", isLocked: false, imageName: "ANKYLOSAURUS", score: 30, genus: "🌱"))
    }
}
