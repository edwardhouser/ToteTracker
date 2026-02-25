//
//  Backgrounds.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/5/26.
//

import SwiftUI

struct Backgrounds {
    // gradient generator: https://angrytools.com/gradient/
    
    static var gradient1 = LinearGradient(
        gradient: Gradient(colors: [
            Color(hex: "#00050A"),
            Color(hex: "#00050A"),
            Color(hex: "#796911"),
            Color(hex: "#B59B15"),
            Color(hex: "#F1CD18")
        ]),
        startPoint: .bottom,  // "to top" in CSS becomes .bottom to .top in SwiftUI
        endPoint: .top
    )
    
    static var gradient2 = LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: "#716B83"),
                Color(hex: "#8D8DA9"),
                Color(hex: "#A5A5CA"),
            ]),
            startPoint: .bottom,  // "to top" in CSS becomes .bottom to .top in SwiftUI
            endPoint: .top
        )
        
        static var gradient3 = LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: "#716B83"),
                Color(hex: "#2F7E9A"),
                Color(hex: "#3B8D99"),
            ]),
            startPoint: .bottom,  // "to top" in CSS becomes .bottom to .top in SwiftUI
            endPoint: .top
        )
        
    }
