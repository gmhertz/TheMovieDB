//
//  MovieDBService.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 23/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import Alamofire
import RxSwift

class MovieDBService {
    enum QueryType: String {
        case upCommingMovies = "/movie/upcoming?"
        case movieGenre = "/genre/movie/list?"
    }
    
    enum MDBError: Error {
        case urlFailure
        case parseError
        case undefined
    }
    
    private let baseURL = "https://api.themoviedb.org/3"
    
    lazy var apiKey: String = {
        if let path = Bundle.main.path(forResource: "MovieDataBaseKey", ofType: "plist"),
            let values = NSDictionary(contentsOfFile: path),
            let topic = values["APIKey"] as? String {
            return topic
        } else {
            return ""
        }
    }()
    
    //control flow
    private var page: Int = 1
    
    
    func getMovies()-> Observable<[Movie]> {
        return Observable.create { observer -> Disposable in
            guard let url = URL(string: self.baseURL + QueryType.upCommingMovies.rawValue + "api_key=" + self.apiKey + "&page=" + self.page.description) else {
                observer.onError(MDBError.urlFailure)
                return Disposables.create()
            }
            AF.request(url, method: .get).validate().responseJSON(completionHandler: { response in
                switch response.result {
                    case .success(let value):
                        guard let json = value as? [String: Any],
                            let data = json["results"] as? [[String:Any]], let currentPage = json["page"] as? Int else {
                                observer.onError(MDBError.parseError)
                                return
                        }
                        self.page = currentPage + 1
                        if let newData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
                            if let movies = try? JSONDecoder.init().decode([Movie].self, from: newData) {
                                observer.onNext(movies)
                            }
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        observer.onError(error)
                }
            })
            return Disposables.create()
        }
    }
    
}
