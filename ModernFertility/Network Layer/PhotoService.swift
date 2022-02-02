//
//  PhotoService.swift
//  MF
//
//  Created by Amit Jain on 1/31/22.
//

import Foundation
struct PhotoService: NetworkService {
     
    var path = "/photos"
    let httpMethodtype = HttpMethod.GET
    
    func callPhotosApi() async throws  -> [Photo] {
        let photos: [Photo] = try await fetchAPI()
#if DEBUG
        if let  photo = photos.first(where: { $0.id == 1 }) {
            print("Resp: \(photo)")
        }
#endif
        
        return photos
    }
}
