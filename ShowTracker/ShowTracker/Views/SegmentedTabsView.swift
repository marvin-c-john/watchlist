//
//  SegmentedTabsView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct SegmentedTabsView: View {
    @ObservedObject var vm : ShowViewModel
    @Namespace var animation
    var body: some View {
        VStack{
            HStack(spacing: 100){
                ForEach(SegmentedTabs.allCases, id: \.rawValue) { item in
                    VStack{
                        Text(item.title.uppercased())
                            .font(.subheadline)
                            .foregroundStyle(vm.selectedFilter == item ? .purple2 : .white) // weiss ändern
                            .fontWeight(vm.selectedFilter == item ? .semibold : .regular)
                        
                        if vm.selectedFilter == item{
                            Rectangle()
                                .foregroundStyle(.purple2)
                                .frame(width: 100, height: 4)
                                .matchedGeometryEffect(id: "filter", in: animation)
                          
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: 100, height: 4)
                        }
                        
                        
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            vm.selectedFilter = item
                        }

                    }
                }
            }
            .overlay{
                Divider()
                    .offset(y:16)
            }
        }
    }
}


#Preview {
    SegmentedTabsView(vm: ShowViewModel())
}
