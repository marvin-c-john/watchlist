//
//  SegmentedTabs.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import Foundation

enum SegmentedTabs: Int, CaseIterable{
    case episodes
    case description
    
    var title: String{
        switch self {
        case.episodes: return "Folgen"
        case.description: return "Über"
        }
    }
}
