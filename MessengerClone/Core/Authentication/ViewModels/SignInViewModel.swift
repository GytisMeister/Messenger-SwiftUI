//
//  SignInViewModel.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-03.
//

import SwiftUI

class SignInViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.signIn(withEmail: email, password: password)
    }
}
