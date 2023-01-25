//
//  Item.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

import Foundation

struct Item: Identifiable, Equatable, Codable {
    var id = UUID()
    var date = Date()
    var title: String
    var text: String
    var mood: String
//    var mood: Enum
}
