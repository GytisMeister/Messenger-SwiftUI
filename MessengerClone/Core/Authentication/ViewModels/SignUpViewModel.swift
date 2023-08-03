//
//  SignUpViewModel.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-03.
//

import SwiftUI

class SignUpViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.signUp(withEmail: email, password: password, fullname: fullname)
    }
}
