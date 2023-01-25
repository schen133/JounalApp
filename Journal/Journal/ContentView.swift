//
//  ContentView.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var itemVM: ItemsVM
    
    var body: some View {
        TabView {
            CompositionView()
                .tabItem {
                    Label("Compose", systemImage: "keyboard")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage:
                    "list.bullet.rectangle.portrait.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Setting", systemImage:
                    "gearshape.fill")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage:
                    "questionmark.app.fill")
                }
        }//end of tabview
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
