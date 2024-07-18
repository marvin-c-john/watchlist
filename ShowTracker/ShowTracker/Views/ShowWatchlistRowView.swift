//
//  ShowWatchlistRowView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct ShowWatchlistRowView: View {
    @ObservedObject var vm : ShowViewModel
    let show: Show

    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 30){
                HStack(spacing: 0){
                    PosterCardView(vm: vm, show: show)
                        .scaleEffect(CGSize(width: 0.4, height: 0.4))
                        .frame(width: 110, height: 100)
                    
                    
                    
                    VStack(alignment: .leading){
                        Text(show.name)
                            .foregroundStyle(.white)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text(show.overview)
                            .foregroundStyle(.gray)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
//                        9813
                    }
                }
                
                Spacer()
                
                CheckboxView(vm: vm)
            }
            .padding()
            .onTapGesture {
                Task{
                   
                    print("Show name\(show.name) ")
                    print("file path\(show.file_path) ")
                    print("Poster Url \(show.posterURL) ")
                }
            }
            }
        }
    }


#Preview {
    ShowWatchlistRowView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
        .background(Color.black)
}
