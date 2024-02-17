//
//  SearchApiService.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation

enum SearchRouter: Router {
    
    case search(_ query: String)
    
    var base: String {
        return APIConstants.host
    }
    
    var path: String {
        return "/movie"
    }
    
    var commonPath: String{
        return "/3/search"
    }
    
    var params: Dictionary<String, String>? {
        switch self {
        case let .search(query):
            return  [
                "api_key" : "38e61227f85671163c275f9bd95a8803",
                "query": "\(query)"
            ]
        }
        
    }
    
    var body: Dictionary<String, String>?{
        return [:]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: Dictionary<String, String>?{
        return [:]
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        return .reloadRevalidatingCacheData
    }
}
