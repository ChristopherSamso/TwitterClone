//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/28/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable().clipShape(Circle())
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "person.crop.circle.badge.plus").resizable().modifier(ProfileImageModifier())
                }
            }.sheet(isPresented: $showImagePicker,
                    onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }.padding(.top, 44)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }.shadow(color: .gray.opacity(0.75), radius: 10, x: 0, y: 0)
            }
            
            Spacer ()
            
        }.ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}


private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
