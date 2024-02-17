//
//  SearchViewModel.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation
import Combine

protocol SearchViewModelProtocol {
    func getSearchMovie(query: String)
    var viewState: AnyPublisher<SearchViewState,Never> { get }
    var searchModels: AnyPublisher<[SearchMovie],Never> { get }
}

class SearchViewModel: SearchViewModelProtocol{
    var searchModels: AnyPublisher<[SearchMovie], Never>{
        self._searchModels.eraseToAnyPublisher()
    }
    var viewState: AnyPublisher<SearchViewState,Never>{
        self._viewState.eraseToAnyPublisher()
    }
    private var _viewState = CurrentValueSubject<SearchViewState,Never>(.normal)
    private var _searchModels = CurrentValueSubject<[SearchMovie],Never>([])
    let apiService: SearchApiService
    
    init(apiService: SearchApiService = RequestManager()){
        self.apiService = apiService
        
    }
    
    func getSearchMovie(query: String) {
        self._viewState.send(.loading)
        self.apiService.searchMovie(query: query) { result in
            switch result {
            case let .success(searchResponse):
                self._viewState.send(.normal)
                self._searchModels.send(searchResponse.results ?? [])
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
