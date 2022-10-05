//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/26/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            // Header View
            AuthenticationHeaderView(title1: "Get Started!", title2: "Create your account")
            
            // Login Info
            VStack(spacing: 40) {
                
                CustomInputField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeHolderText: "Username", text: $username)
                
                CustomInputField(imageName: "person", placeHolderText: "Full Name", text: $fullname)
                
                CustomInputField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)

            }.padding(32)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up").font(.headline).foregroundColor(.white).frame(width: 340, height: 50).background(Color(.systemBlue)).clipShape(Capsule()).padding()
            }.shadow(color: .gray.opacity(0.75), radius: 10, x: 0, y: 0)
            
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?").font(.footnote)
                    Text("Sign In").font(.footnote).fontWeight(.semibold)
                }
            }.padding(.bottom, 32)

            
        }.ignoresSafeArea().fullScreenCover(isPresented: $viewModel.didAuthenticateUser) {
            ProfilePhotoSelectorView()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
