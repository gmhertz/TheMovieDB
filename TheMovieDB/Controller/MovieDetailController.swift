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
    private var scene: MovieDetailView!
    private let disposeBag = DisposeBag()
    
    init(movie: Movie) {
        self.movie = movie
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
    }

}
