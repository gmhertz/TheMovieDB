//
//  MovieGridViewSpec.swift
//  TheMovieDBTests
//
//  Created by Günter Hertz on 23/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import TheMovieDB

class MoviewGridViewSpec: QuickSpec {
    override func spec() {
        describe("Movie list screen") {
            it("has valid snapshot with correct layout") {
                //To check another iphone sizes just replace the width and height
                let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
                let view = MovieGridView(frame: frame)
                //                expect(view) == snapshot("MovieListView")
                //                This code below is to generate a new snapshot to compare
                expect(view) == recordSnapshot("MovieListView")
            }
        }
    }
}
