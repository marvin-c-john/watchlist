//
//  ShowWatchListView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct ShowWatchListView: View {
    @ObservedObject var vm : ShowViewModel
    var show: Show
    var body: some View {
        
        
        NavigationView{
            ScrollView(showsIndicators: false){
                    VStack{
                        
                        ForEach(vm.shows){ show in
                            NavigationLink {
                                ShowView(vm: vm, show: show)
                            } label: {
                                ShowWatchlistRowView(vm: vm, show: show)
                            }
                            
                        }
                    }
                }
                .navigationTitle("Watchlist")
     
              
           
        }
    }
}

#Preview {
    ShowWatchListView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
}
