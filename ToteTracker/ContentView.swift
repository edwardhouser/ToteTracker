//
//  ContentView.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/5/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var totes: [Tote]
    @State private var selectedTote: Tote?
    
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isShowingAddGroup =  false
    @Environment(\.dismiss) var dismiss
    
    
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(selection: $selectedTote){
                ForEach(totes) { tote in
                    NavigationLink(value: tote) {
                        Label(tote.toteName, systemImage: "box")
                        
                    }
                }
            }
            
            } detail: {
                Text("Select an item")
            }
        }
    }

// Need to add additem and deleteItem to the item detail view
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(name: "New Item")
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }


//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
