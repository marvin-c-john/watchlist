//
//  NetworkService.swift
//  ShowTracker
//
//  Created by Marvin John on 17.07.24.
//

import Foundation



class NetworkService {
    private let apiKey = "e2aa9c39501552e4b964e0d89aaa3ef4"
    private let baseURL = "https://api.themoviedb.org/3"
    private let session: URLSession
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    func searchShows(query: String) async throws -> [Show] {
        guard let url = buildURL(endpoint: "/search/tv", query: query) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        
        do {
            let showsResponse = try JSONDecoder().decode(ShowsResponse.self, from: data)
            return showsResponse.results
        } catch {
            throw error
        }
    }
    
    func getShowImages(showId: Int) async throws -> [ImageData] {
        let filePath = "/tv/\(showId)/images"
        guard let url = buildImageURL(filePath: filePath) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        
        do {
            let imagesResponse = try JSONDecoder().decode(ImageResult.self, from: data)
            return imagesResponse.posters
        } catch {
            throw error
        }
    }
    
    private func buildURL(endpoint: String, query: String) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query)
        ]
        return components?.url
    }
    
    private func buildImageURL(filePath: String) -> URL? {
        var components = URLComponents(string: baseURL + filePath)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        return components?.url
    }
}

