//
//  GenreCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var typeLabel: UILabel!{
        didSet {
            if typeLabel.font.pointSize < GenreCell.minSize {
                GenreCell.minSize = typeLabel.font.pointSize
            }
            else {
                typeLabel.font.withSize(GenreCell.minSize)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static var  minSize :CGFloat  = 20.0
}
