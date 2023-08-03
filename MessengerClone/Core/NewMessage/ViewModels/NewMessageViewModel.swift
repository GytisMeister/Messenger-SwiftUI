//
//  NewMessageViewModel.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-03.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetUsers() }
    }
    

    func fetUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
}
