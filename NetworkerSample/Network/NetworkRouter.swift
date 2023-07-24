//
//  NetworkRouter.swift
//  NetworkerSample
//
//  Created by Sajith Konara on 24/7/23.
//

import Foundation
import Networker
import Alamofire

enum NetworkRouter:URLRequestConvertible{
    
    case getUsers

    var path:String{
        switch self {
        case .getUsers:
            return "/profile"
        }
    }
    
    var method:HTTPMethod{
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var params:Parameters?{
        switch self {
        case .getUsers:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = "https://64bd3fa42320b36433c788c7.mockapi.io"
        let url =  try URL(string: baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!)!
        let request = try URLRequest(url: url, method: method)
        return try URLEncoding.default.encode(request, with: params)
    }
    
}

