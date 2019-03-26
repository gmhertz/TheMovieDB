//
//  MovieDetailController.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 25/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MovieDetailController: UIViewController {
    private var movie: Movie!
    private var genres: [String]
    private var scene: MovieDetailView!
    private let disposeBag = DisposeBag()
    
    init(movie: Movie, genres: [String]) {
        self.movie = movie
        self.genres = genres
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        scene = MovieDetailView(frame: UIScreen.main.bounds)
        self.view = scene
    }
    
    override func viewDidLoad() {
        scene
            .closeButton
            .rx
            .tap
            .subscribe(onNext: { self.dismiss(animated: true, completion: nil) })
            .disposed(by: disposeBag)
        
        //fill the view info
        scene.titleLabel.text = movie.name
        scene.overview.text = movie.overview
        scene.releaseLabel.text = movie.releaseDate
        scene.genreLabel.text = genres.joined(separator: ", ")
        if let path = movie.posterPath, path != nil {
            let imageURL = "http://image.tmdb.org/t/p/w185/" + path
            scene.poster.getImageFromURL(url: imageURL)
        }
        
    }

}
