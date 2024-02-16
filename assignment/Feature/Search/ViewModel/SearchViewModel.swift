//
//  SearchViewModel.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation

protocol SearchViewModelProtocol {
    
    func getSearchMovie(query: String)
    
}

class SearchViewModel: SearchViewModelProtocol{
   
    
    
    let apiService: SearchApiService
    
    init(apiService: SearchApiService = RequestManager()){
        self.apiService = apiService
        
    }
    
    func getSearchMovie(query: String) {
        
        self.apiService.searchMovie(query: query) { result in
            
            switch result {
                
            case let .success(searchResponse):
                
                print(searchResponse)
                
            case let .failure(error):
                print(error.localizedDescription)
                
                
            }
            
            
        }
       
        
    }

}





