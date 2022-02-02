//
//  Photo.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import Foundation

struct Photo  : Decodable  {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
}

extension Photo {
    
    func isFavorite() -> Bool {
        let defaults = UserDefaults.standard
        let photoKey = "photo"+String(id)
        let value = defaults.bool(forKey: photoKey)
        print("\(photoKey) read as \(value)")
        return value
    }
    
    func setFavorite(favorite:Bool) {
        let defaults = UserDefaults.standard
        let photoKey = "photo"+String(id)
        defaults.setValue(favorite, forKey: photoKey)
        defaults.synchronize()
        
        print("\(photoKey) set as \(defaults.bool(forKey: photoKey))")
    }
    
}
