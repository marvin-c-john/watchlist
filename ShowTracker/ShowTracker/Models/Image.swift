//
//  Image.swift
//  ShowTracker
//
//  Created by Marvin John on 17.07.24.
//

import Foundation

struct ImageResult: Identifiable, Decodable {
    let id: Int
    let backdrops: [ImageData]
    let logos: [ImageData]
    let posters: [ImageData]
}

struct ImageData: Decodable, Hashable {
    let file_path: String
}


struct Poster: Identifiable, Codable {
    let id = UUID()
    let file_path: String
    let aspect_ratio: Double
    let height: Int
    let iso_639_1: String?
    let vote_average: Double
    let vote_count: Int
    let width: Int
}

struct TMDbResponse: Codable {
    struct TVShow: Codable {
        let id: Int
    }
    let results: [TVShow]
}

struct TMDbImageResponse: Codable {
    let posters: [Poster]
}

