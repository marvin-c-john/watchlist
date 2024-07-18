//
//  DiscoverView.swift
//  ShowTracker
//
//  Created by Marvin John on 17.07.24.
//

import SwiftUI


struct DiscoverView: View {
    @ObservedObject var vm: ShowViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // SearchView
                    HStack {
                        TextField("Suchen", text: $vm.query)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .onChange(of: vm.query) { _, newValue in
                                Task {
                                    await vm.searchShows()
                                  
                                }
                            }
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(vm.shows) { show in
                            ShowWatchlistRowView(vm: vm, show: show)
                                .onAppear {
                                    Task {
                                        await vm.fetchImage(for: show.id)
                                    }
                                }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Discover")
        }
    }
}


#Preview {
    DiscoverView(vm: ShowViewModel())
}
