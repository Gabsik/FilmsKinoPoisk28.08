//
//  OtherRatingCollectionViewCell.swift
//  URLSessionApi
//
//  Created by User on 31.08.2023.
//

import UIKit
import SnapKit

class OtherRatingCollectionViewCell: UICollectionViewCell {
    
    let viewFon: UIView = {
       let viewFonView = UIView()
        viewFonView.backgroundColor = .gray.withAlphaComponent(0.2)
        return viewFonView
    }()
    let nameRatingLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    private func setup () {
        addSubview(viewFon)
        viewFon.addSubview(nameRatingLabel)
        constr()
    }
    private func constr() {
        viewFon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.edges.equalToSuperview()
        }
        nameRatingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
