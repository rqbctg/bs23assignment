//
//  SearchView.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import UIKit

enum SearchViewState {
    case loading
    case normal
}

enum SearchSection {
    case main 
}

class SearchView: UIView {
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.searchCVLayout()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.keyboardDismissMode = .onDrag
        collectionView.contentInset = UIEdgeInsets(
            top: 2,
            left: 0,
            bottom: 16,
            right: 0
        )
        collectionView.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchCollectionViewCell.identifier
        )
        return collectionView
    }()
    
    lazy var activityView : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        activity.color = .black
        activity.hidesWhenStopped = true
        return activity
        
    }()
    
    
    let viewModel: SearchViewModelProtocol
    
    init(with: SearchViewModelProtocol){
        self.viewModel = with
        super.init(frame: .zero)
        self.addView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        self.addSubview(collectionView)
        self.addSubview(activityView)
        collectionView.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    private func searchCVLayout()->UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, env in
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupLayoutSize, subitems: [item])
            group.interItemSpacing = .fixed(6)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 6, bottom: 16, trailing: 6)
            
            return section
        }
        return layout
    }
    
}
