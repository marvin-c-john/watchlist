//
//  ShowTrackerApp.swift
//  ShowTracker
//
//  Created by Marvin John on 15.07.24.
//

import SwiftUI

@main
struct ShowTrackerApp: App {
    @StateObject var vm = ShowViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm, show: Show(id: 9813, name: "avid Benioff", overview: "blabla", file_path: "/2RMejaT793U9KRk2IEbFfteQntE.jpg"))
        }
    }
}
