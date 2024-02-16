//
//  SearchViewModel.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation

protocol SearchViewModelProtocol {
    
    func fetchSerachData(query: String)
    
}

class SearchViewModel: SearchViewModelProtocol{
    func fetchSerachData(query: String) {
        
    }
    
    
    let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol = RequestManager()){
        self.requestManager = requestManager
        
        
        
    }
    
    
    

}
