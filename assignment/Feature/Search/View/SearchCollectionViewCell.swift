//
//  CollectionViewCell.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell: UICollectionViewCell {
    
    lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    lazy var imageContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    lazy var lblDescription : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.contentMode = .top
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    lazy var lblContentCompression : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.setContentHuggingPriority(.defaultLow, for: .vertical)
        lbl.font = UIFont.systemFont(ofSize: 1)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var topSeparatorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addView()
    }
    
    private func addView(){
        
        addSubview(topSeparatorView)
        addSubview(containerStackView)
        
        topSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        topSeparatorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        topSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16).isActive = true
        
        containerStackView.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor,constant: 8).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16).isActive = true
    
        containerStackView.addArrangedSubview(imageContainerView)
        imageContainerView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        containerStackView.setCustomSpacing(8, after: imageContainerView)
        
        imageContainerView.addSubview(imageView)
        
        imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(lblTitle)
        infoStackView.setCustomSpacing(8, after: lblTitle)
        infoStackView.addArrangedSubview(lblDescription)
        infoStackView.addArrangedSubview(lblContentCompression)
        infoStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSearchCVCell(identifier: SearchMovie){
        
        lblTitle.text = identifier.title
        
        lblDescription.text = identifier.overview
        
        imageView.sd_setImage(with: identifier.posterPath?.mediaURL,placeholderImage: UIImage(systemName: "nosign"))
    }
}
