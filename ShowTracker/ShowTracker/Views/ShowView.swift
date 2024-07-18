//
//  ShowView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct ShowView: View {
    @ObservedObject var vm : ShowViewModel
    var show: Show
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(){
                TopView(vm: vm, show: show)
                
                SegmentedTabsView(vm: vm)
                
                
                if vm.selectedFilter == .episodes {
                    PickerView(vm: vm)
                }
                
               
                
                if vm.selectedFilter == .episodes {
                    EpisodeRowView(vm: vm)
                } else if vm.selectedFilter == .description {
                    DescriptionView()
                }
            }
        }
        .background(vm.selectedFilter == .episodes ?  Color.gray.opacity(0.1) : Color.black)
    }
}

#Preview {
    ShowView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "snowfall"))
}
