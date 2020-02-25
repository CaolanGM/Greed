//
//  ScoreCell.swift
//  Greed
//
//  Created by Squid Rewards on 17/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class ScoreCell: UICollectionViewCell {
    
    @IBOutlet weak var scoreL: UILabel!
    
    
    func setCell(_ row:Int,_ column:Int)
    {
        scoreL.text = String(row) + String(column)
    }
    
    func setName(_ playerName:String)
    {
        scoreL.text = playerName
    }
    
    func setTotal(_ total:Int)
    {
        scoreL.text = String(total)
    }
}
