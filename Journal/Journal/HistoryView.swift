//
//  HistoryView.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

//File of list displaying, remove, move, and viewing
import SwiftUI

struct HistoryView: View {
    @State private var showAlert = false
    @EnvironmentObject var itemsVM: ItemsVM
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(itemsVM.items) { item in
                    NavigationLink {
                        Text(item.text)
                            .multilineTextAlignment(.leading)
                    } label: {
                        HStack {
                            Text(item.mood)
//                                .resizable()
//                                .frame(width: 32, height: 32, alignment: .leading)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                Text(item.date, formatter: itemFormatter)
                                
                            }
                            Spacer()
                        }
                    }//end of label
                }//end of for each loop
                .onDelete(perform: itemsVM.remove)
                .onMove(perform: itemsVM.move)
            }//end of list
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action: {
                        showAlert = true
                        
                    }, label: {
                        Label("move", systemImage: "trash")
                    })
                    .alert(isPresented: $showAlert){
                        Alert(
                                title: Text("Delete all history. This action is not undoable and will delete all your data."),
                                primaryButton:
                                        .destructive(Text("Ok")) {
                                            itemsVM.items.removeAll()
                                        },
                                        secondaryButton: .cancel()
                                    )
                        
                        
                    }
                    
                    
                }//end of toolbaritem
            }
            
        
        }//end of navigation view
        
    }//end of body view
    
    
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()



struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
        
    }
}
