//
//  RoundCell.swift
//  Greed
//
//  Created by Squid Rewards on 17/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class RoundCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ dsd: UICollectionViewDelegate & UICollectionViewDataSource,_ row:Int){setCollectionViewDataSourceDelegate(dsd, forRow: row)}

}

extension RoundCell{
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDelegate & UICollectionViewDataSource>
        (_ dataSourceDelegate: D, forRow row:Int)
    {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        print("Reload Table Collect")
        collectionView.reloadData()
    }
}
