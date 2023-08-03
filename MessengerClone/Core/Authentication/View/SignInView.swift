//
//  SignInView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                // Logo
                Image("messenger_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                // Textfields
                VStack(spacing: 12){
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
                // forgot password
                Button{
                    print("Forgot password?")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                        .foregroundColor(Color(.systemBlue))
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity,alignment: .trailing)
                // Sign In button
                Button{
                    Task { try await viewModel.signIn() }
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                
                CustomDivider()
                
                // Sign In with facebook
                HStack{
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                // Already Member
                NavigationLink{
                    SignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct CustomDivider: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            
            Text("OR")
                .font(.footnote)
                .fontWeight(.semibold)
            
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(Color(UIColor.systemGray))
    }
}
