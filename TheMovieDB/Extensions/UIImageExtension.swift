//
//  UIImageExtension.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 24/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import Kingfisher
import UIKit

extension UIImageView {
    func getImageFromURL(url: String) {
        if let url = URL(string: url) {
            self.kf.setImage(with: ImageResource(downloadURL: url),
                             placeholder: UIImage(named: "movieDB"))
            
        }
    }
}
