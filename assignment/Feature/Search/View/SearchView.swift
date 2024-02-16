//
//  SearchView.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import UIKit

class SearchView: UIView {
    
    let viewModel: SearchViewModelProtocol
    
    init(with: SearchViewModelProtocol){
        self.viewModel = with
        super.init(frame: .zero)
        
    }
    
}
