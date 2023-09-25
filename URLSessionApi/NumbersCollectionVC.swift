//
//  NumbersCollectionVC.swift
//  URLSessionApi
//
//  Created by User on 18.09.2023.
//

import UIKit
import SnapKit

class NumbersCollectionVC: UIViewController {
    var collectionView: UICollectionView!
    var numbers = [1,2,3,4,5,6,7,8,9,10]
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
        constraints()
    }
    private func setupe() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: "NumberCell")
        view.addSubview(collectionView)
    }
    private func constraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension NumbersCollectionVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell" , for: indexPath) as! NumberCell
        let number = numbers[indexPath.item]
        if number == 1 || number == 2 || number == 3 {
            cell.numberTextLabel.textColor = .red
        }else if number == 4 || number == 5 {
            cell.numberTextLabel.textColor = .yellow
        }else{
            cell.numberTextLabel.textColor = .green
        }
        cell.numberTextLabel.text = "\(number)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
class NumberCell: UICollectionViewCell{
    let numberTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(numberTextLabel)
        setting()
    }
    private func setting() {
        numberTextLabel.frame = contentView.bounds
        numberTextLabel.font = .boldSystemFont(ofSize: 60)
        numberTextLabel.textAlignment = .center
        numberTextLabel.textColor = .black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
