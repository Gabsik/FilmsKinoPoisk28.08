//
//  RateMovieViewController.swift
//  URLSessionApi
//
//  Created by User on 13.09.2023.
//

import UIKit
import SnapKit
import Kingfisher

class RateMovieViewController: UIViewController {
    let nameWindowLabel = UILabel()
    var filmCoverImage = UIImageView()
    let film: Doc
    let nameFilmLabel = UILabel()
    let circleView = UIView()
    let rateButton = UIButton()
    
    init(film: Doc) {
        self.film = film
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    private func setupe() {
        view.addSubview(nameWindowLabel)
        view.addSubview(filmCoverImage)
        view.addSubview(nameFilmLabel)
        view.addSubview(circleView)
        view.addSubview(rateButton)
        view.backgroundColor = .gray
        constraints()
        setting()
        usePictures()
    }
    private func constraints() {
        nameWindowLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(30)
        }
        filmCoverImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameWindowLabel.snp.bottom).offset(30)
            make.width.equalTo(240)
            make.height.equalTo(300)
        }
        nameFilmLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(filmCoverImage.snp.bottom).offset(10)
        }
        circleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameFilmLabel.snp.bottom).offset(80)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        rateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(150)
        }
    }
    private func setting() {
        //MARK: setting nameWindowLabel
        nameWindowLabel.text = " Оценить"
        nameWindowLabel.font = .boldSystemFont(ofSize: 25)
        nameWindowLabel.textColor = .black
        //MARK: setting nameFilmLabel
        nameFilmLabel.textColor = .black
        nameFilmLabel.font = .boldSystemFont(ofSize: 22)
        nameFilmLabel.text = film.name
        //MARK: setting circleView
        circleView.backgroundColor = .darkGray
        circleView.layer.cornerRadius = 75
        //MARK: setting rateButton
        rateButton.setTitle("Оценить", for: .normal)
        rateButton.layer.cornerRadius = 15
        rateButton.backgroundColor = .darkGray
        
        
        
    }
    private func config(with url: URL) {
        filmCoverImage.kf.setImage(with: url)
    }
    private func usePictures() {
        if let imageURL = URL(string: film.poster.url) {
        config(with: imageURL)
        }else {
            print("Non")
        }
    }
}
