//
//  MoviesListView.swift
//  MovieDB
//
//  Created by Günter Hertz on 23/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import SnapKit
import UIKit

final class MovieGridView: UIView{
    
    lazy var navigationBar: UINavigationBar = {
        let bar = UINavigationBar(frame: .zero)
        bar.backgroundColor = .purple
        bar.barStyle = .black
        bar.isTranslucent = true
    
        return bar
    }()
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar(frame: .zero)
        bar.barTintColor = .newPink
        bar.placeholder = "Search"
        return bar
    }()
    
    lazy var movieCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MovieCell.self, forCellWithReuseIdentifier: "moviePosterCell")
        collection.backgroundColor = .newPink
        return collection
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This should not happen - init(coder) has not been implementes")
    }
    
}

extension MovieGridView: CodeView {
    func viewHierarchy() {
        addSubview(navigationBar)
        addSubview(searchBar)
        addSubview(movieCollection)
        
    }
    
    func viewConstraints() {
        navigationBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
//            $0.top.equalToSuperview()
            $0.top.equalTo(navigationBar.snp.bottom)
        }
        
        movieCollection.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
    
    func viewAdditionalConfiguration() {
        movieCollection.delegate = self
        
        
        if let layout = movieCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            layout.scrollDirection = .vertical
        }
    }
}


extension MovieGridView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            assertionFailure("Unexpected layout type: \(type(of: collectionViewLayout))")
            return CGSize.zero
        }
        
        let width = (collectionView.frame.width - layout.minimumInteritemSpacing - layout.sectionInset.left - layout.sectionInset.right)/2.0
        let height = collectionView.frame.height * 0.35
        return CGSize(width: width, height: height)
    }
}
