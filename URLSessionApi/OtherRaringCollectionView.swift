//
//  OtherRaringCollectionView.swift
//  URLSessionApi
//
//  Created by User on 31.08.2023.
//

import UIKit

class OtherRaringCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(OtherRatingCollectionViewCell.self, forCellWithReuseIdentifier: "OtherRatingCollectionViewCell")
        layout.minimumLineSpacing = Constr.minimumLineSpacing //Растояние между ячейками
        showsHorizontalScrollIndicator = false // убрать индикатор прокрутки по горизоннтале
        contentInset = UIEdgeInsets(top: 0 , left: Constr.leftDistatanseToView, bottom: 0, right: Constr.rightDistatanseToView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension OtherRaringCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "OtherRatingCollectionViewCell" , for: indexPath) as! OtherRatingCollectionViewCell
        return cell
    }
}
extension OtherRaringCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constr.itemWidth, height: 200)
    }
}
