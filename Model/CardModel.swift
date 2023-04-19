//
//  File.swift
//
//
//  Created by Marta Michelle Caliendo on 14/04/23.
//

import Foundation

struct CardModel: Identifiable, Equatable {
    let id: UUID = UUID()
    var ID: Int
    var flipped = false
    var matched = false
}
