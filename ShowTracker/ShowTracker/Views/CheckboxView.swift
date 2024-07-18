//
//  CheckboxView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct CheckboxView: View {
    @ObservedObject var vm : ShowViewModel
    var body: some View {
        VStack{
            
            Button {
                vm.isChecked.toggle()
            } label: {
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 3)
                    .fill(vm.isChecked ? .white : .clear)
                    .frame(width: 40, height: 30)
                    .shadow(radius: 5)
                    .overlay {
                        Image(systemName: vm.isChecked ? "checkmark" : "")
                            .foregroundStyle(vm.isChecked ? .purple2 : .clear)
                            .fontWeight(.bold)
                    }
            }

           
        }
    }
}

#Preview {
    CheckboxView(vm: ShowViewModel())
}
