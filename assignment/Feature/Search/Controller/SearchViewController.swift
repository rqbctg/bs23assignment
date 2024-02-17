//
//  SearchViewController.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol
    var mainView : SearchView
    
    init(with: SearchViewModelProtocol = SearchViewModel()) {
        self.viewModel = with
        self.mainView = SearchView(with: with)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Movie List"
        self.view.backgroundColor = .systemBackground
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        // Initialize UISearchController
        self.navigationItem.searchController = self.mainView.searchController
        self.mainView.searchController.searchBar.delegate = self
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text , !text.isEmpty {
            self.viewModel.getSearchMovie(query: text)
        }
        searchBar.text = ""
        self.mainView.searchController.dismiss(animated: true)
    }
}
