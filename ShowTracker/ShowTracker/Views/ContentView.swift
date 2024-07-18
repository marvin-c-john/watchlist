//
//  ContentView.swift
//  ShowTracker
//
//  Created by Marvin John on 15.07.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm : ShowViewModel
    var show: Show
    var body: some View {
        TabView{
            ShowWatchListView(vm: vm, show: show)
                .tabItem {
                   Label("Serien", systemImage: "tv")
                       
                }
            
            TopView(vm: vm, show: show)
                .tabItem {
                   Label("Filme", systemImage: "film")
                       
                }
            
            DiscoverView(vm: vm)
                .tabItem {
                   Label("Suche", systemImage: "magnifyingglass")
                       
                }
            
            TopView(vm: vm, show: show)
                .tabItem {
                   Label("Profil", systemImage: "person")
                       
                }
        }
        .tint(.purple2)
       

    }
}

#Preview {
    ContentView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
}
