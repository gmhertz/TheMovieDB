//
//  DetailView.swift
//  TheMovieDB
//
//  Created by Günter Hertz on 25/03/19.
//  Copyright © 2019 Günter Hertz. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailView: UIView {
    
    // MARK: background views
    lazy var blurView: UIView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let bluerEffectView = UIVisualEffectView(effect: blurEffect)
        bluerEffectView.alpha = 0.5
        bluerEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return bluerEffectView
    }()
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .beige
        view.layer.cornerRadius = 10.0
        
        return view
    }()
    
    lazy var pinkBand: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .newPink
        
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .beige
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = .flexibleHeight
        view.addSubview(contentView)
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)        
        view.addSubview(titleLabel)
        view.addSubview(poster)
        view.addSubview(overview)
        view.addSubview(releaseLabel)
        view.addSubview(genreLabel)
        
        
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "Close"), for: .normal)
        
        
        return button
    }()
    
    // MARK: view with data
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "INSIRA UM TITULO DE UM FILME SUFICIENTEMENTE GRANDE"
//        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    lazy var poster: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "movieDB")
        image.layer.cornerRadius = 10.0
        return image
    }()
    
    lazy var overview: UILabel = {
        let label = UILabel(frame: .zero)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 20
        label.textAlignment = .justified
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        return label
    }()
    
    lazy var releaseLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "AQUI VAI UMA DATA"
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Genres: "
        
        return label
    }()
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MovieDetailView: CodeView {
    func viewHierarchy() {
        //background views
        addSubview(blurView)
        addSubview(backView)
        addSubview(pinkBand)
        addSubview(scrollView)
        addSubview(closeButton)
    }
    
    func viewConstraints() {
        blurView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        backView.snp.makeConstraints {
            $0.center.equalTo(blurView.snp.center)
            $0.left.equalTo(blurView.snp.left).offset(20)
            $0.top.equalTo(blurView.snp.top).offset(50)
        }
        
        pinkBand.snp.makeConstraints {
            $0.center.equalTo(backView.snp.center)
            $0.left.equalTo(backView.snp.left).offset(10)
            $0.top.equalTo(backView.snp.top).offset(10)
        }
        
        scrollView.snp.makeConstraints {
            $0.center.equalTo(pinkBand.snp.center)
            $0.top.equalTo(pinkBand.snp.top).offset(5)
            $0.left.equalTo(pinkBand.snp.left).offset(5)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.left.right.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            //TO DO: better way
            $0.height.equalTo(1000)
        }
        
        closeButton.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(20)
            $0.top.equalTo(backView.snp.top).offset(20)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.top.equalTo(contentView.snp.top).offset(70)
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        poster.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        releaseLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(poster.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        overview.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(releaseLabel.snp.bottom).offset(30)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        genreLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(overview.snp.bottom).offset(30)
            $0.height.greaterThanOrEqualTo(0)
        }
    }
    
    func viewAdditionalConfiguration() {
        
    }
    
    
}
