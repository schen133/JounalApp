//
//  CompositionView.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

//Adding new item in list
import SwiftUI
struct CompositionView: View {
    
    @State private var title = ""
    @State private var mainText = ""
    private var moodArray = ["😌", "😋", "😎", "🥲", "😢"]
    @State private var moodIndex = 2
    @State private var showActionSheet = false
    @State private var cursorOnTitle = false
    @EnvironmentObject var itemsVM: ItemsVM
    @FocusState private var cursorfocus: Bool

    var body: some View {
        Form {
            //title
            Section("Title") {
                TextField("Title", text: $title)
                    .focused($cursorfocus)
            }
            //mood
            Section(header: Text("Mood").font(.headline).foregroundColor(.black)) {
                Picker("Occasion", selection: $moodIndex) {
                    ForEach(0..<moodArray.count){
                        Text(self.moodArray[$0])
                    }
                }
//            .pickerStyle(.segmented)
            .background(.white)
            }
            //text
            Section("Text") {
                TextEditor(text: $mainText)
                    .frame(minHeight: 300, alignment: .leading)
                    .cornerRadius(10.0)
                    .shadow(radius: 1.0)
                    .multilineTextAlignment(.leading)
            }
            Button("New"){
                showActionSheet = true
            }.actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Save this entry before creating a new one?"),
                                    buttons: [
                                        .destructive(Text("No")){ //reset pages
                                        action: do {
                                            mainText = ""
                                            title = ""
                                            moodIndex = 2
                                            cursorfocus.toggle()
                                        }
                                        },
                                        .default(Text("Yes")) { //adds item information and resets page
                                        action: do {
                                            itemsVM.add(title: title, text: mainText, mood:moodArray[moodIndex])
                                            mainText = ""
                                            title = ""
                                            moodIndex = 2
                                            cursorfocus.toggle()
                                        }
                                        }
                                    ]// end of button
                )// end of ActionSheet()
                
           }// end of .actionSheet
        
        
        
    }
    
}

}
