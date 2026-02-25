//
//  Tote.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/10/26.
//
import Foundation
import SwiftData

@Model

final class Tote: Identifiable {
    var id: UUID
    var createdAt: Date
    var toteName: String
    var toteDescription: String
    var outsideImage: String?
    var insideImage1: String?
    var insideImage2: String?

    
    
    init(toteName: String, toteDescription: String) {
        self.id = UUID()
        self.createdAt = Date()
        self.toteName = toteName
        self.toteDescription = toteDescription
    }
    
    
    
}
