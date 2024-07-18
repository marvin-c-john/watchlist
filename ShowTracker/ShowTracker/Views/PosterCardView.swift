//
//  PosterCardView.swift
//  ShowTracker
//
//  Created by Marvin John on 15.07.24.
//

import SwiftUI

struct PosterCardView: View {
    @ObservedObject var vm : ShowViewModel

    var show: Show
    
    var body: some View {
        if let posterURL = show.posterURL {
            AsyncImage(url: posterURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 208, height: 298)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                case .failure(_):
                    placeholderImage
                        .frame(width: 208, height: 298)
                @unknown default:
                    placeholderImage
                        .frame(width: 208, height: 298)
                }
            }
            .frame(width: 208, height: 298)
            .cornerRadius(20)
            .shadow(radius: 10)
        } else {
            placeholderImage
                .frame(width: 208, height: 298)
        }
    }
    
    var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}


#Preview {
    PosterCardView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
}
