//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 24/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import SnapKit
import UIKit

class MovieCell: UICollectionViewCell {
    let image: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(posterPath: String = "") {
        //fill the image
        if !posterPath.isEmpty {
            let imageURL = "http://image.tmdb.org/t/p/w185/" + posterPath
            image.getImageFromURL(url: imageURL)
        } else {
            image.image = UIImage(named: "movieDB")
        }
        
    }
}

extension MovieCell: CodeView {
    func viewHierarchy() {
        addSubview(image)
    }
    
    func viewConstraints() {
        image.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
    }
    
    func viewAdditionalConfiguration() {
        
    }
}
