//
//  ContentView.swift
//  ShowTracker
//
//  Created by Marvin John on 15.07.24.
//

import SwiftUI

struct TopView: View {
    @ObservedObject var vm : ShowViewModel
    var show: Show
    var body: some View {
        
        
        
        VStack(alignment: .center) {
            PosterCardView(vm: vm, show: show)
                .frame(width: 200, height: 200)
                .padding(.top, 50) // war davor auf 100
                .padding(.bottom, 60)
            
            //Title
            Text("Snowfall")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(20)
            
            Text("3 Seasons ∘ 18 Episodes")
                .foregroundStyle(.white.opacity(0.6))
                .font(.caption)
                .padding(.bottom, 90)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("snowfall")
                .resizable()
                .scaledToFill()
                .frame(width: 800)
                .blur(radius: 60) //50 ändern falls nötig
        )
        
    }
}



#Preview {
    TopView(vm: ShowViewModel(), show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
}
