//
//  InfoFilmsCell.swift
//  URLSessionApi
//
//  Created by User on 13.08.2023.
//

import UIKit
import SnapKit

class InfoFilmsCell: UITableViewCell {
    
    let fontOfSize5 = UIFont.systemFont(ofSize: 13)
    
    let coverImage = UIImageView()
    let nameFilmLabel = UILabel()
    let genreFilmLabel = UILabel()
    let countryFilmLabel = UILabel()
    let yearFilmLabel = UILabel()
    let lengthFilmLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupe()
        constraints()
        setting()
    }
    private func setupe() {
        contentView.addSubview(coverImage)
        contentView.addSubview(nameFilmLabel)
        contentView.addSubview(genreFilmLabel)
        contentView.addSubview(countryFilmLabel)
        contentView.addSubview(yearFilmLabel)
        contentView.addSubview(lengthFilmLabel)
    }
   private func constraints() {
        coverImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(15)
            make.height.equalTo(150)
            make.width.equalTo(100)
        }
       nameFilmLabel.snp.makeConstraints { make in
           make.left.equalTo(coverImage.snp.right).offset(45)
           make.top.equalToSuperview().inset(15)
       }
       genreFilmLabel.snp.makeConstraints { make in
           make.left.equalTo(coverImage.snp.right).offset(50)
           make.top.equalTo(nameFilmLabel.snp.bottom).offset(5)
           make.right.equalToSuperview().inset(1)
       }
       countryFilmLabel.snp.makeConstraints { make in
           make.left.equalTo(coverImage.snp.right).offset(50)
           make.top.equalTo(genreFilmLabel.snp.bottom).offset(5)
       }
       yearFilmLabel.snp.makeConstraints { make in
           make.left.equalTo(coverImage.snp.right).offset(50)
           make.top.equalTo(countryFilmLabel.snp.bottom).offset(5)
       }
       lengthFilmLabel.snp.makeConstraints { make in
           make.left.equalTo(coverImage.snp.right).offset(50)
           make.top.equalTo(yearFilmLabel.snp.bottom).offset(5)
       }
    }
    private func setting() {
        nameFilmLabel.font = UIFont.boldSystemFont(ofSize: 20)
        genreFilmLabel.font = fontOfSize5
        genreFilmLabel.numberOfLines = 0
        countryFilmLabel.font = fontOfSize5
        yearFilmLabel.font = fontOfSize5
        lengthFilmLabel.font = fontOfSize5
        
    }
    private func configure(with url: URL) {
        coverImage.kf.setImage(with: url)
    }
    func configure(with film: Doc ) {
        if let imageURL = URL(string: film.poster.url) {
            configure(with: imageURL)
        }
        nameFilmLabel.text = film.name
        genreFilmLabel.text =  "Жанр: \(film.genres.map { $0.name }.joined(separator: ", "))"
        countryFilmLabel.text = "Страна: \(film.countries.map { $0.name }.joined(separator: ", "))"
        yearFilmLabel.text = "Год: \(film.year)"
        lengthFilmLabel.text = "Время просмотра: \(film.movieLength) мин"
    }
}
