//
//  SearchView.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import UIKit

class SearchView: UIView {
    
    let viewModel: SearchViewModelProtocol
    
    init(with: SearchViewModelProtocol){
        self.viewModel = with
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
