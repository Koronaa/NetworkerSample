//
//  NetworkLayer.swift
//  NetworkerSample
//
//  Created by Sajith Konara on 24/7/23.
//

import Foundation
import Networker
import Alamofire

class NetworkLayer{
    
    static let shared = NetworkLayer()
    
    private var apiManager:APIManager!
    private var configManager:ConfigurationManager!
    
    private init(){
        configManager = ConfigurationManager.shared
        configManager.setSession(using: URLSessionConfiguration.default)
        apiManager = APIManager()
    }
    
    func getResponse<T:Decodable>(for request:URLRequestConvertible,for responseType:T.Type) async throws -> T{
        return try await apiManager.makeRequest(with: request, for: responseType)
    }
    
    
}
