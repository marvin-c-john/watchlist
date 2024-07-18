//
//  PickerView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct PickerView: View {
    
    @State private var selectedSeason = "Staffel 1"
    @ObservedObject var vm : ShowViewModel
    
    
    var body: some View {
        HStack(alignment: .center) {
            VStack{
                Picker("", selection: $selectedSeason) {
                    ForEach(vm.seasons, id: \.self){ season in
                        Text(season)
                            .foregroundStyle(.white)
                    }
                   
                }
                .tint(.white)
                .frame(width: 120 ,height: 40)
                .background(
                    Rectangle()
                        .fill(.gray.opacity(0.1))
                        .cornerRadius(10)
                )
                
            }
        
            Spacer()
            
            CheckboxView(vm: vm)
                .padding(.trailing, 13)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 30)

    }
}

#Preview {
    PickerView(vm: ShowViewModel())
}
