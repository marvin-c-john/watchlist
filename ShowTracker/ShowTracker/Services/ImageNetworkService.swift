//
//  ImageNetworkService.swift
//  ShowTracker
//
//  Created by Marvin John on 18.07.24.
//

//import Foundation
//
//class ImageNetworkService{
//    
//    
//    func getfilePath(seriesId: Int) async throws -> [ImageData]{
//        guard let url = URL(string: "https://api.themoviedb.org/3/tv/\(seriesId)/images") else {
//            throw NetworkError.invalidURL
//        }
//        
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            return
//        } catch {
//            throw error
//        }
//    }
//    
//}
