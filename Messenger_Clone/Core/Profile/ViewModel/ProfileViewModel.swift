//
//  ProfileViewModel.swift
//  Messenger_Clone
//
//  Created by Lê Văn Duy on 19/12/2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { 
            Task {
                try await loadImage()
            }
        }
    }
    
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
