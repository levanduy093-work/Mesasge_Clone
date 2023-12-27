//
//  LoginView.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 18/12/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
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
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifer())
                }
                
                // Forgot button
                Button(action: {
                    print("Forgor password")
                }, label: {
                    Text("Forgor password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                })
                .hSpacing(.trailing)
                
                // Login button
                Button(action: {
                    Task {
                        try await viewModel.login()
                    }
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.blue))
                        .foregroundColor(Color(.white))
                        .cornerRadius(10)
                })
                .padding(.vertical)
                
                // Divider
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                // facebook login
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top)
                
                Spacer()
                
                // sign up page
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
