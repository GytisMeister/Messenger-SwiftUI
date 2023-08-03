//
//  SignUpView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            Spacer()
            // Logo
            Image("messenger_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
            // Textfields
            VStack(spacing: 12){
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                TextField("Enter your email", text: $viewModel.email)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)
                SecureField("Enter your password", text: $viewModel.password)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)
            }
            Button{
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
