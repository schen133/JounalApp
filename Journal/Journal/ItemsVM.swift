//
//  ItemsVM.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

import Foundation

class ItemsVM: ObservableObject {
    
    @Published var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }

    func add(title: String, text: String, mood: String) {
        //Pass in title, text, and mood
        items.insert(Item(title: title, text: text, mood: mood), at: 0)

    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    func remove(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}
