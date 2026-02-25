//
//  Item.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/10/26.
//

import Foundation
import SwiftData

@Model

final class Item: Identifiable {
    var id: UUID
    var name: String
    var itemImage: String?
    
    var tote: Tote
    
    init(name: String, tote: Tote) {
        self.id = UUID()
        self.name = name
        self.tote = tote
        
    }
}
