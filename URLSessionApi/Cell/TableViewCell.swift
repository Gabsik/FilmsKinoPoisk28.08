//
//  TableViewCell.swift
//  URLSessionApi
//
//  Created by User on 07.08.2023.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    var image = UIImageView()
    let nameFilmLabel = UILabel()
    let genreFilmLabel = UILabel()
    let countriesFilmLabel = UILabel()
    let yearFilmLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupe()       
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupe()
    }
     private func setupe() {
         contentView.addSubview(image)
         contentView.addSubview(nameFilmLabel)
         contentView.addSubview(genreFilmLabel)
         contentView.addSubview(countriesFilmLabel)
         contentView.addSubview(yearFilmLabel)
         image.clipsToBounds = true
         
         nameFilmLabel.font = UIFont.boldSystemFont(ofSize: 22)
         
         genreFilmLabel.font = UIFont.systemFont(ofSize: 13)
         genreFilmLabel.numberOfLines = 0
         
         countriesFilmLabel.font = .systemFont(ofSize: 13)
         
         yearFilmLabel.font = .systemFont(ofSize: 13)

        image.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(30)
            make.width.equalTo(100)
            make.height.equalTo(150)

        }
         nameFilmLabel.snp.makeConstraints { make in
             make.left.equalTo(image.snp.right).offset(50)
             make.top.equalToSuperview().inset(50)
         }
         genreFilmLabel.snp.makeConstraints { make in
             make.top.equalTo(nameFilmLabel.snp.bottom).offset(5)
             make.left.equalTo(image.snp.right).offset(50)
             make.right.equalToSuperview().inset(10)
         }
         countriesFilmLabel.snp.makeConstraints { make in
             make.top.equalTo(genreFilmLabel.snp.bottom).offset(5)
             make.left.equalTo(image.snp.right).offset(50)
             make.right.equalToSuperview().inset(10)
         }
         yearFilmLabel.snp.makeConstraints { make in
             make.top.equalTo(countriesFilmLabel.snp.bottom).offset(5)
             make.left.equalTo(image.snp.right).offset(50)
         }
    }
    
    private func configure(with url: URL) {
        image.kf.setImage(with: url)
    }
    
    func configure(with film: Doc) {
        if let imageURL = URL(string: film.poster.url) {
            configure(with: imageURL)
        }
        nameFilmLabel.text = film.name
        genreFilmLabel.text = "Жанр: \(film.genres.map { $0.name }.joined(separator: ", "))"
        countriesFilmLabel.text = "Страна: \(film.countries.map { $0.name }.joined(separator: ", "))"
        yearFilmLabel.text = "Год: \(film.year)"
    }
}
