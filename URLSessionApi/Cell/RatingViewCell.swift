//
//  RatingViewCell.swift
//  URLSessionApi
//
//  Created by User on 29.08.2023.
//

import UIKit
import SnapKit
import Kingfisher

class RatingViewCell: UITableViewCell {
    let nameRatingLabel = UILabel()
    let ratingLabel = UILabel()
    let estimateButton = UIButton()
    let viewFon = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    private func setup() {
        contentView.addSubview(ratingLabel)
        contentView.addSubview(nameRatingLabel)
        contentView.addSubview(estimateButton)
        contentView.addSubview(viewFon)
        viewFon.addSubview(ratingLabel)
        viewFon.addSubview(nameRatingLabel)
        viewFon.addSubview(estimateButton)
        constraints()
        setting()
    }
    private func constraints() {
        ratingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameRatingLabel.snp.bottom).offset(10)
            //make.bottom.greaterThanOrEqualTo(15)
        }
        nameRatingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            //make.bottom.greaterThanOrEqualToSuperview().inset(50)
        }
        estimateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ratingLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        viewFon.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(220)
            make.width.equalTo(400)
        }
    }
    private func setting() {
        ratingLabel.font = UIFont.systemFont(ofSize: 70)
        ratingLabel.textColor = .green
        ratingLabel.numberOfLines = 0
        //MARK: Настройка "Рейтинг Кинопоиска"
        nameRatingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameRatingLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
        //MARK: Настройка кнопки
        estimateButton.setTitle("Оценить", for: .normal)
        estimateButton.backgroundColor = .orange
        estimateButton.layer.cornerRadius = 20
        estimateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        //MARK: Настройка фона
        viewFon.backgroundColor = .gray.withAlphaComponent(0.2)
    }
    func configure(with film:Doc) {
        ratingLabel.text = "\(film.rating.kp)"
        nameRatingLabel.text = "Рейтинг Кинопоиска"
    }

}
