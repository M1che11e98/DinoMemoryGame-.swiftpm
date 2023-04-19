//
//  File.swift
//  
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import Foundation
import SwiftUI

struct ItemsModel: Codable, Identifiable {
    let id: Int
    let species: String
    let era: String
    let family: String
    let description: String
    let description2: String
    let description3: String
    var isLocked: Bool
    let imageName: String
    let score: Int
    let genus: String
    
    init(id: Int, species: String, era: String, family: String, description: String, description2: String, description3: String, isLocked: Bool, imageName: String, score: Int, genus: String) {
        self.id = id
        self.species = species
        self.era = era
        self.family = family
        self.description = description
        self.description2 = description2
        self.description3 = description3
        self.isLocked = isLocked
        self.imageName = imageName
        self.score = score
        self.genus = genus
    }
    
    
    
    
    
    
}


