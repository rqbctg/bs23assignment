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
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var lblDescription : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(lblTitle)
        addSubview(lblDescription)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    
        
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSearchCVCell(identifier: SearchMovie){
        
        lblTitle.text = identifier.title
        
        imageView.sd_setImage(with: identifier.posterPath?.mediaURL,placeholderImage: UIImage(named: "tv"))
        
        
        
        
    }
    
}
