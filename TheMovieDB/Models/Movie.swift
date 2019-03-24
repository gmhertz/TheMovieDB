//
//  Movie.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 23/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

struct Movie: Codable {
    let id: Int
    let name: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let genrerIds: [Int]
    let releaseDate: String
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case posterPath = "poster_path"
        case overview
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genrerIds = "genre_ids"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        overview = try values.decode(String.self, forKey: .overview)
        posterPath = try values.decode(String.self, forKey: .posterPath)
        backdropPath = try values.decode(String.self, forKey: .backdropPath)
        genrerIds = try values.decode([Int].self, forKey: .genrerIds)
        releaseDate = try values.decode(String.self, forKey: .releaseDate)
    }
}
