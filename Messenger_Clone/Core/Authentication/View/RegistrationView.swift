//
//  RegistrationView.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 18/12/2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // image
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .padding()
            
            // Text field
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .modifier(TextFieldModifer())
                
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .autocapitalization(.words)
                    .modifier(TextFieldModifer())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .modifier(TextFieldModifer())
            }
            
            // Sign up button
            Button(action: {
                Task {
                    try await viewModel.createUser()
                }
            }, label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .background(Color(.blue))
                    .foregroundColor(Color(.white))
                    .cornerRadius(10)
            })
            .padding(.vertical)
            
            Spacer()
            
            // sign up page
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
