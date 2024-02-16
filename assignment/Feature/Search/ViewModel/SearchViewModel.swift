//
//  SearchViewModel.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import UIKit
import Combine



protocol SearchViewModelProtocol {
    func getSearchMovie(query: String)
    var searchDataSource: UICollectionViewDiffableDataSource<SearchSection,SearchMovie>? { get set }
    
}



class SearchViewModel: SearchViewModelProtocol{
    var searchDataSource: UICollectionViewDiffableDataSource<SearchSection, SearchMovie>?
    
    let apiService: SearchApiService
    
    init(apiService: SearchApiService = RequestManager()){
        self.apiService = apiService
        
    }
    
    func getSearchMovie(query: String) {
        self.apiService.searchMovie(query: query) { result in
            switch result {
            case let .success(searchResponse):
                
                self.applySnapshot(models: searchResponse.results ?? [])
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func applySnapshot(models: [SearchMovie]){
        if models.count <= 0 { return }
        
        var snapshot = NSDiffableDataSourceSnapshot<SearchSection,SearchMovie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(models, toSection: .main)
        self.searchDataSource?.apply(snapshot,animatingDifferences: false)
    }

}





