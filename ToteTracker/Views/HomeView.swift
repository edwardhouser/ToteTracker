//
//  HomeView.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/12/26.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var totes: [Tote]
    
    
    var body: some View {
        NavigationSplitView{
            ZStack{
                Backgrounds.gradient1.ignoresSafeArea()
                
                List {
                    ForEach(totes) { tote in
                        NavigationLink(value:tote){
                            Text(tote.toteName)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}
