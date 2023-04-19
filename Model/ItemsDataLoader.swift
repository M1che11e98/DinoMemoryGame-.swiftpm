//
//  File.swift
//  
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import Foundation

class ItemsDataLoader: ObservableObject {
    @Published var items = [ItemsModel]()
    
    init(){
        readjson()
    }
    func readjson(){
        if let fileLocation = Bundle.main.url(forResource: "ItemsData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = try JSONDecoder().decode([ItemsModel].self, from: data)
                self.items = jsonDecoder
            } catch {
                print("decode error")
            }
        }
    }
}
