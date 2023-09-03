//
//  OtherRatingVCell.swift
//  URLSessionApi
//
//  Created by User on 31.08.2023.
//

import UIKit
import SnapKit

class OtherRatingVCell: UITableViewCell {
    
    private let collectionView = OtherRaringCollectionView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }

}
