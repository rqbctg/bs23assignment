//
//  CollectionViewCell.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell: UICollectionViewCell {
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
        return lbl
    }()
    
    lazy var lblDescription : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.contentMode = .top
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(lblTitle)
        addSubview(lblDescription)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor,constant: 16).isActive = true
        
        
        lblTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 8).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8).isActive = true
        lblTitle.topAnchor.constraint(equalTo: imageView.topAnchor,constant: 0).isActive = true
        
        lblDescription.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 8).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8).isActive = true 
        lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor,constant: 8).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.lblDescription.bottomAnchor, constant: 0).isActive = true
   
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
