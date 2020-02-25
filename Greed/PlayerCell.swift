//
//  PlayerCell.swift
//  Greed
//
//  Created by Squid Rewards on 04/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    
    var index:Int = 0

    
    @IBOutlet weak var playerLab: UILabel!
    
    @IBOutlet weak var tvPlayerName: UITextField!
    
    var add: ((_ testStr:String,_ index:Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }

    func setCell(_ i:Int)
    {
        index = i
        tvPlayerName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        playerLab.text = "PLAYER " + String(i+1) + ":"
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        add?(textField.text!,index)
    }
}
