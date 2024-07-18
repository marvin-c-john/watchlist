//
//  ShowDetailView.swift
//  ShowTracker
//
//  Created by Marvin John on 17.07.24.
//

import SwiftUI

struct ShowDetailView: View {
    @ObservedObject var vm : ShowViewModel
    var show: Show
    var body: some View {
        VStack {
            
            PosterCardView(vm: vm, show: show)
            
//            Text(vm.shows[0].name)
//                .font(.title)
//                .padding()
            
//            Text(vm.shows[0].overview)
//                .padding()
            
            Spacer()
        }
//        .navigationTitle(vm.shows[0].name)
    }
}

#Preview {
    ShowDetailView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
}
