//
//  User.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-02.
//

import Foundation

struct User : Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let Mock_User = User(fullname: "Tony Stark", email: "ironman@gmail.com", profileImageUrl: "ironman")
}
