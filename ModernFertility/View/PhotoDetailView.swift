//
//  PhotoDetailView.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo:Photo
    
    var body: some View {
        PhotoContentView(photo: photo, isThumbnail: false)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let photo = Photo(albumId: 1, id: 1, title: "ddsff dsgf", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
        PhotoDetailView(photo: photo)
    }
}
