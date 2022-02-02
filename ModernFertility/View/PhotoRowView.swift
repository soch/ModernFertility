//
//  PhotoRowView.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import SwiftUI
struct PhotoRowView: View {
    var photo:Photo
    @State private var isSheetOpened = false
    
    var body: some View {
        VStack {
            PhotoContentView(photo: photo, isThumbnail: true)
        }
    }
    
}

struct PhotoRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        let photo = Photo(albumId: 1, id: 1, title: "ddsff dsgf", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
        PhotoRowView(photo: photo)
    }
}

