//
//  PhotoContentView.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import SwiftUI

struct PhotoContentView: View {
    var photo:Photo
    var isThumbnail:Bool

    @State private var isSheetOpened = false

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: (isThumbnail ? photo.thumbnailUrl: photo.url))) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "photo")
                                    .onAppear {
                                        print("fetching photo:\(photo.id)  error: \(phase.error.debugDescription)")
                                    }
                                
                            @unknown default:
                                // Since the AsyncImagePhase enum isn't frozen,
                                // we need to add this currently unused fallback
                                // to handle any new cases that might be added
                                // in the future:
                                EmptyView()
                            }
                        }
        .aspectRatio(contentMode: .fit)
        .sheet(isPresented: $isSheetOpened) {
            PhotoDetailView(photo: photo)
        }
        .onTapGesture { //toggle state var to open sheet
            print("touched item")
            if (isThumbnail){
                isSheetOpened.toggle()
            }
        }
            
            HStack {
                Text("\(photo.title)")
                if self.isThumbnail {
                    Spacer()
                    FavoriteButtonView(photo: photo)
                }
            }.padding(10)
        }
    }
}

struct FavoriteButtonView: View {
    var photo:Photo
    @State var isFavorite:Bool
    
    init(photo:Photo){
        self.photo = photo
        self.isFavorite =  photo.isFavorite()
    }
    
    var body: some View {
        Button(action: {
                isFavorite.toggle()
                photo.setFavorite(favorite: isFavorite)
        }) {
           HStack {
               Image(systemName: imageForHeart())
           }
        }
    }
    
    func imageForHeart() -> String {
        self.isFavorite ? "heart.fill" :"heart"
    }
}

struct PhotoContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let photo = Photo(albumId: 1, id: 1, title: "ddsff dsgf", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
        PhotoContentView(photo: photo, isThumbnail: true)
    }
}
