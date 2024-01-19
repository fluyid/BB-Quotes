//
//  ViewModel.swift
//  BB Quotes
//
//  Created by Kailash Nath on 19/01/2024.
//

import Foundation

// class is more flexible than struct
@MainActor //This needs to be running on the main thread
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    // published is written so that the view can be observed. set allows other things to see the property but not change it
    
    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do {
            let quote = try await controller.fetchQuote(from: show)  // we have to use try await if we use async throws (used in FetchController)
            
            let character = try await controller.fetchCharacter(quote.character)
            
            status = .success(data: (quote, character))
        } catch  {
            status = .failed(error: error)
        }
    }
    
}
