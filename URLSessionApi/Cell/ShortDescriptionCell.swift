//
//  ShortDescriptionCell.swift
//  URLSessionApi
//
//  Created by User on 19.08.2023.
//

import UIKit
import SnapKit

class ShortDescriptionCell: UITableViewCell {
    
    let descriptionFilmLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    private func setup() {
        contentView.addSubview(descriptionFilmLabel)
        constraints()
        setting()
    }
    private func constraints() {
        descriptionFilmLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.left.equalToSuperview().inset(12)
            make.right.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
    }
    private func setting() {
        descriptionFilmLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionFilmLabel.numberOfLines = 0
    }
    func configure(with film: Doc) {
        descriptionFilmLabel.text = film.description
    }
    
    
}
