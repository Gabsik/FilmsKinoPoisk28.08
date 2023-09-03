//
//  Constraints.swift
//  URLSessionApi
//
//  Created by User on 01.09.2023.
//

import CoreGraphics
import UIKit


struct Constr {
    static let leftDistatanseToView: CGFloat = 15
    static let rightDistatanseToView: CGFloat = 15
    static let minimumLineSpacing: CGFloat = 5
    static let itemWidth = (UIScreen.main.bounds.width - Constr.leftDistatanseToView - Constr.rightDistatanseToView - (Constr.minimumLineSpacing / 2)) / 2
    
}
