//
//  MovieGridViewController.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 24/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class MovieGridViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: MovieListViewModel
    private var scene: MovieGridView!
    
    
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
    
    override func loadView() {
        scene = MovieGridView(frame: UIScreen.main.bounds)
        self.view = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfMovieData>(
            configureCell: {  _, collectionView, indexPath, item -> UICollectionViewCell in
                let cell: MovieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviePosterCell", for: indexPath) as! MovieCell
                cell.setup(posterPath: item.posterPath ?? "")
                cell.backgroundColor = .black
                return cell
            }
        )
        
        viewModel
            .movieSectionData
            .bind(to: scene.movieCollection.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        //load more movies
        scene
            .movieCollection
            .rx.didScroll
            .map { [unowned self] _ in self.scene.movieCollection.isBouncingBottom }
            .bind(to: viewModel.shouldLoadMoreMovies)
            .disposed(by: disposeBag)
        
        scene
            .movieCollection
            .rx
            .modelSelected(Movie.self)
            .asObservable()
            .subscribe(onNext: {[unowned self] movie in
                //find a better way
                var genreNames: [String] = []
                for gen in self.viewModel.movieGenres {
                    if movie.genrerIds.contains(gen.id) {
                        genreNames.append(gen.name)
                    }
                }
                let detailController = MovieDetailController(movie: movie, genres: genreNames )
                detailController.modalPresentationStyle = .overCurrentContext
                detailController.modalTransitionStyle = .crossDissolve
                print(movie.name)
                self.present(detailController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)

    }
}
