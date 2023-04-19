//
//  SwiftUIView.swift
//  
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import SwiftUI

struct DinoLibraryView: View {
    @AppStorage("userXP") var userXP: Int = 1000
    @StateObject var vm: ItemsDataLoader = ItemsDataLoader()
    let backgroundColor: Color = Color.theme.rowColorGreen2
    let backgroundColor2: Color = Color.theme.rowColorGreen2
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .font(.system(size: 32))
                    Text("\(userXP)")
                        .font(.custom("Dinosaur", size: 30))
                        .foregroundColor(.white)
                } .padding([.trailing, .top])
                List(vm.items) { item in
                    Section {
                        if item.score <= userXP {
                            NavigationLink {
                                DinoInformationView(item: item)
                            } label: {
                                DinoRowView(item: item)
                            }
                            .listRowBackground(Color.clear)
                            .padding()
                            .background(
                                .regularMaterial, in: RoundedRectangle(cornerRadius: 20)
                            )
                            .shadow(radius: 5, x: -8, y: 8)
                            .listRowSeparator(.hidden)
                        } else {
                            DinoRowView(item: item)
                                .listRowBackground(Color.clear)
                                .padding()
                                .background(
                                    .regularMaterial, in: RoundedRectangle(cornerRadius: 20)   
                                )
                                .shadow(radius: 5, x: -8, y: 8)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                
            }     .background(
                LinearGradient(colors: [backgroundColor, backgroundColor2], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            )
        }
    }
}

struct DinoLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        DinoLibraryView()
    }
}
