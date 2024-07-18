//
//  Show.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import Foundation


struct ShowsResponse: Decodable {
    let results: [Show]
}

struct Show: Identifiable, Decodable {
    let id: Int
    let name: String
    let overview: String
    let file_path: String? // Poster Path aus der Show API

    // Funktion zur Erstellung der vollständigen Poster-URL
    var posterURL: URL? {
          guard let file_path = file_path else { return nil }
          let baseURL = "https://image.tmdb.org/t/p/original"
          return URL(string: baseURL + file_path)
      }
}





