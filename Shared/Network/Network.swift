//
//  Network.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 05/10/23.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: apiPoint)!)
}
