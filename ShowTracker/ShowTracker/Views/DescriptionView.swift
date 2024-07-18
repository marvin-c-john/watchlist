//
//  DescriptionView.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack{
                Text("This is a long as description and I hope this app os going to be a succrs fuck the others I want this app fpr me i want it to look sexy for me fuck the others")
                    .foregroundStyle(.white)
            }
            .padding()
            .padding(.top, 50)
        }
        .frame(minHeight: 700)
    }
}

#Preview {
    DescriptionView()
}
