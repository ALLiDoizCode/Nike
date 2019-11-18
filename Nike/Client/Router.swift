//
//  Router.swift
//  Nike
//
//  Created by Jonathan Green on 11/13/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import Foundation

enum Router {
    case topAlbums
    
    func request() throws -> URLRequest {
        var urlRequest:URLRequest
        switch self {
        case .topAlbums:
            urlRequest = URLRequest(url: try baseURL())
            urlRequest.httpMethod = "GET"
        }
        return urlRequest
    }
}
