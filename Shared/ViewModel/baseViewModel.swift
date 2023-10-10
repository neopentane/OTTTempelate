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
    
    @Published var data: Query.Data?
    @Published var isLoading = true
    private let useCase: BaseViewUseCaseProtocol
    
    init(useCase: BaseViewUseCaseProtocol) {
        self.useCase = useCase
        self.start()
        
    }
    
    func start() {
        useCase.fetchData { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let data):
                    self?.data = data
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
}


class BaseViewUseCase : BaseViewUseCaseProtocol {
    func fetchData(completion: @escaping (Result<Query.Data?, Error>) -> Void) {
        repository.fetchData(completion: completion)
    }
    
    private let repository: BaseRepositoryProtocol
    
    init(repository: BaseRepositoryProtocol) {
        self.repository = repository
    }
}

class BaseRepository : BaseRepositoryProtocol {
    //    func fetchData() -> Result<Query.Data?, Error> {         Network.shared.apollo.fetch(query: Query()) { result in
    //        switch result {
    //        case .success(let graphQLResult):
    //            print("Success! Result: \(graphQLResult)")
    //            return graphQLResult
    //        case .failure(let error):
    //            return error
    //        }
    //    }
    //    }
    
    func fetchData(completion: @escaping (Result<Query.Data?, Error>) -> Void) {
        Network.shared.apollo.fetch(query: Query()) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                } else if let errors = graphQLResult.errors {
                    completion(.failure(GraphQLError.fetchError))
                } else {
                    completion(.failure(GraphQLError.fetchError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}

protocol BaseRepositoryProtocol {
    func fetchData(completion: @escaping (Result<Query.Data?, Error>) -> Void)
}

protocol BaseViewUseCaseProtocol {
    func fetchData(completion: @escaping (Result<Query.Data?, Error>) -> Void)
}





