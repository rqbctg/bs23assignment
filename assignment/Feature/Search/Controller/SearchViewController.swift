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
    
    init(with: SearchViewModelProtocol) {
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
        
        self.title = "Search"
        self.view.backgroundColor = .red
    }
    
}
