//
//  JournalApp.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

import SwiftUI

@main
struct JournalApp: App {
    @Environment(\.scenePhase) var scenePhase
    var itemsVM: ItemsVM

    init() {
        itemsVM = ItemsVM(items: FileManager.default.getItems())
    }
        
    var body: some Scene {
                
        WindowGroup {
            ContentView()
                .environmentObject(itemsVM)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Background")
                FileManager.default.saveItems(items: itemsVM.items)
            }
        }
//        WindowGroup{
//        ContentView()
//        }
    }
    
}
