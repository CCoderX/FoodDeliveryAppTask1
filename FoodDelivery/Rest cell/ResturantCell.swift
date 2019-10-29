//
//  ResturantCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ResturantCell: UITableViewCell {

    @IBOutlet weak var FoodGenreCollectionView: UICollectionView!

    var types = ["greek","indian"]//,"egyptian","american"]
    override func awakeFromNib() {
        super.awakeFromNib()
        FoodGenreCollectionView.delegate = self
        FoodGenreCollectionView.dataSource = self
        FoodGenreCollectionView.registerCellNib(cellClass: GenreCell.self)
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ResturantCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as GenreCell
        cell.typeLabel.text = types[indexPath.row]
        cell.typeLabel.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if types.count <= 2 {
            return CGSize(width: (collectionView.frame.width/2) - 2, height: 15)
        }
        return CGSize(width: (collectionView.frame.width/2.5) - 2, height: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
}
