//
//  YouWonVC.swift
//  Greed
//
//  Created by Squid Rewards on 06/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class YouWonVC: UIViewController {

    var player:String?
    
    
    @IBOutlet weak var playerL: UILabel!
    
    
    @IBAction func continueClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        playerL.text = player
    }
    

    func createPopUp(_ playerP:String,completion:@escaping ()->()){

        player = playerP
        completion()
        
    }

}
