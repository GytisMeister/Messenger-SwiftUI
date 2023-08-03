//
//  User.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-02.
//

import Foundation
import FirebaseFirestoreSwift

struct User : Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
}

extension User {
    static let Mock_User = User(fullname: "Tony Stark", email: "ironman@gmail.com", profileImageUrl: "ironman")
}
