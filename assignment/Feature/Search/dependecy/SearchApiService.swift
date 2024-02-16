//
//  SearchApiService.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import Foundation


protocol SearchApiService {
    
    func searchMovie(query:String,completion: @escaping ((Result<SearchResponse,NetworkError>) -> Void))

}

extension RequestManager : SearchApiService {
    func searchMovie(query: String, completion: @escaping ((Result<SearchResponse, NetworkError>) -> Void)) {
        self.performRequest(router: SearchRouter.search(query), completion: completion)
    }
}
