//
//  PhotoViewModel.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import Foundation
class PhotoViewModel : ObservableObject {
    let photoService:PhotoService = PhotoService()
    var photos: [Photo] = []
    @Published var loading:Bool = true

    func fetchPhotos() async {
        do {
            let photosData = try await photoService.callPhotosApi()
            DispatchQueue.main.async { [weak self] in //can use @MainActor on the VM, but then request & response go on mainQ.
               
                self?.photos = photosData
                self?.loading = false
            }
        } catch {
            print("Fetching photos  failed with error \(error)")
            DispatchQueue.main.async { [weak self] in
                self?.loading = false
            }
        }
    }
}
