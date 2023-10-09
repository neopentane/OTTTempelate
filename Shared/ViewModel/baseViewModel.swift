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
import Combine

class baseViewModel: ObservableObject {
    
    private let useCase: BaseViewUseCaseProtocol
    
    init(useCase: BaseViewUseCaseProtocol) {
        self.useCase = useCase
        
    }
    
    func start() {
        self.useCase.fetchData().receive(on: Scheduler)
    }
    /*init() {
        Network.shared.apollo.fetch(query: Query()) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                let t = type(of: graphQLResult)
                print("Type of \(t)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }*/
}


class BaseViewUseCase : BaseViewUseCaseProtocol {
    func fetchData() -> Future<Query.Data?, GraphQLError> {
        repository.fetchData()
    }
    
    private let repository: BaseRepositoryProtocol
    
    init(repository: BaseRepositoryProtocol) {
        self.repository = repository
    }
}

class BaseRepository : BaseRepositoryProtocol {
    func fetchData() -> Future<Query.Data?, GraphQLError>  {
        let future = Future<Query.Data?, GraphQLError> { promise in
            Network.shared.apollo.fetch(query: Query()) { result in
                switch result {
                case .success(let graphQLResult):
                    return promise(.success(graphQLResult.data))
                case .failure(let error):
                    return promise(.failure(error as! GraphQLError))
                }
            }
        }
        return future
    }
}

protocol BaseRepositoryProtocol {
    func fetchData() -> Future<Query.Data?, GraphQLError>
}

protocol BaseViewUseCaseProtocol {
    func fetchData() -> Future<Query.Data?, GraphQLError>
}





