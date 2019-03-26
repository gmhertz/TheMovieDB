//
//  MovieDetailViewSpec.swift
//  TheMovieDBTests
//
//  Created by Günter Hertz on 25/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import TheMovieDB

class MovieDetailViewSpec: QuickSpec {
    override func spec() {
        describe("Movie detail screen") {
            it("has valid snapshot with correct layout") {
                //To check another iphone sizes just replace the width and height
                let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
                let view = MovieDetailView(frame: frame)
                //                expect(view) == snapshot("MovieListView")
                //                This code below is to generate a new snapshot to compare
                expect(view) == recordSnapshot("MovieDetailView")
            }
        }
    }
}
