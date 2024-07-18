//
//  EpisodeRowView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct EpisodeRowView: View {
    @ObservedObject var vm : ShowViewModel
    var body: some View {
        ForEach(0..<20) { item in
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.1))
                    .frame(height: 80)
                    .shadow(color: .gray.opacity(0.3), radius: 10)
                
                HStack {
                    Text("\(item + 1). Der Mann aus Kansas")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                   CheckboxView(vm: vm)
                }
                .padding(20)
            }
            .padding()
        }
    
    }
}

#Preview {
    EpisodeRowView(vm: ShowViewModel())
       
}
