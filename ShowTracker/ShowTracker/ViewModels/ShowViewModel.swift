//
//  ShowViewModel.swift
//  ShowTracker
//
//  Created by Marvin John on 16.07.24.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var selectedFilter: SegmentedTabs = .episodes
    @Published var isChecked = false
    @Published var query: String = ""
    @Published var errorMessage = ""
    @Published var shows: [Show] = []
    @Published var selectedShow: Show? = nil
    @Published var image : [ImageData] = []
    
    @Published var networkService = NetworkService()
    let seasons = ["Staffel 1", ""]

    init() {}
    
    
    
    
    
    
    
    func searchShows() async {
        do {
            let fetchedShows = try await networkService.searchShows(query: query)
            DispatchQueue.main.async {
                self.shows = fetchedShows
                self.errorMessage = ""
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
        
    }
    func fetchImage(for showId: Int) async{
        Task{
            do{
                let images = try await networkService.getShowImages(showId: showId)
                DispatchQueue.main.async {
                    self.image = images
                }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    
    
    
    func fetchSeriesIDs(for seriesNames: [String]) async -> [Show] {
        let baseURL = "https://api.themoviedb.org/3/search/tv"
        var fetchedSeries: [Show] = []

        // Durchlaufe die Seriennamen und rufe die IDs ab
        for seriesName in seriesNames {
            guard let url = URL(string: "\(baseURL)?api_key=\(apiKey)&query=\(seriesName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else { continue }

            do {
                // Führe die Netzwerkanfrage aus und warte auf die Antwort
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // Verarbeite die erhaltenen Daten
                if let result = try? JSONDecoder().decode(ShowsResponse.self, from: data) {
                    // Extrahiere nur die benötigten Informationen aus den Ergebnissen
                    let shows = result.results.map { Show(id: $0.id, name: $0.name, overview: $0.overview, file_path: $0.file_path) }
                    fetchedSeries.append(contentsOf: shows)
                } else {
                    let show = Show(id: 0, name: seriesName, overview: "", file_path: nil) // Hier könntest du entscheiden, wie du fehlende Daten handhaben möchtest
                    fetchedSeries.append(show)
                }
            } catch {
                print("Error fetching data for \(seriesName): \(error)")
                let show = Show(id: 0, name: seriesName, overview: "", file_path: nil) // Bei einem Fehler könntest du ebenfalls entscheiden, wie du damit umgehen möchtest
                fetchedSeries.append(show)
            }
        }
        
        return fetchedSeries
    }


}

