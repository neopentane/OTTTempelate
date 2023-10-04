//
//  baseViewModel.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 05/10/23.
//

import Foundation
import Apollo
import StarWarsAPI
import ApolloAPI

class baseViewModel: ObservableObject {
    
    
    init() {
        Network.shared.apollo.fetch(query: Query()) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
        
    }
}


