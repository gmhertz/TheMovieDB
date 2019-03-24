//
//  MovieListViewModel.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 24/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import RxDataSources
import RxSwift

class MovieListViewModel {
    private let disposeBag = DisposeBag()
    private let service = MovieDBService()
    
    // Mark: output signals
    var movieSectionData = BehaviorSubject<[SectionOfMovieData]>(value: [])
    var genrers = PublishSubject<[Genre]>()
    var movies: [Movie] = []
    
    
    init() {
        //bind movie genre
        service
            .getGenre()
            .debug("fetch genre")
            .bind(to: genrers)
            .disposed(by: disposeBag)
        
        
        service
            .getMovies()
            .map { [SectionOfMovieData(items: $0)] }
            .bind(to: movieSectionData)
            .disposed(by: disposeBag)
        
        

    }
}


//RxDatasource
struct SectionOfMovieData: Equatable {
    var items: [Movie]
    
//    static func == (lhs: SectionOfMovieData, rhs: SectionOfMovieData) -> Bool {
//        return lhs.items == rhs.items
//    }
}

extension SectionOfMovieData: SectionModelType {
    typealias Item = Movie
    
    init(original: SectionOfMovieData, items: [Item]) {
        self = original
        self.items = items
    }
}
