//
//  user.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/7/26.
//

import Foundation
import SwiftData
import CryptoKit


@Model

final class User: Identifiable {
    var id: String
    var name: String
    var email: String
    var password: String
    
    init (name: String, email: String, password: String) {
        self.id = UUID().uuidString
        self.name = name
        self.email = email
        self.password = User.hashPassword(password)
    }
    
    static func hashPassword(_ password:String) -> String{
        let data = Data(password.utf8)
        let hash = SHA256.hash(data: data)
        return hash.compactMap{String(format:"%02x",$0)}.joined()
    }
}
