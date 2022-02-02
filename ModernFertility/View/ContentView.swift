//
//  ContentView.swift
//  ModernFertility
//
//  Created by Amit Jain on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var photoManager = PhotoViewModel()
    
    var body: some View {
        NavigationView {
            PhotosListView()
                .environmentObject(photoManager)
                .navigationTitle("Modern Fertility")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
