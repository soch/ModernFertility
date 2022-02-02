//
//  PhotosListView.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import SwiftUI

struct PhotosListView: View {
    
    @EnvironmentObject var photoManager: PhotoViewModel
    
    var body: some View {
        VStack
        {
            if photoManager.loading {
                ProgressView()
            } else {
                ScrollView { //https://developer.apple.com/forums/thread/682498?login=true
                    GroupBox{
                       ForEach  (photoManager.photos, id: \.id  ) {(photo) in
                            PhotoRowView(photo:photo)
                        }
                    }
                }
            }
        }
        .task { // cancells  automatically on view disappearing
            await photoManager.fetchPhotos()
        }
        .refreshable {
            await photoManager.fetchPhotos()
        }
    }
}
