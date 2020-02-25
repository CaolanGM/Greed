//
//  EnterScoreVC.swift
//  Greed
//
//  Created by Squid Rewards on 06/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class EnterScoreVC: UIViewController {

    var player:String?
    var userIndex:Int?
    @IBOutlet weak var playerL: UILabel!
    
    @IBOutlet weak var etScore: UITextField!
    
    var addScore: ((_ score:Int) -> ())?
    
    @IBAction func enterClicked(_ sender: Any) {
        
        if(!(etScore.text)!.isEqual(""))
        {
            let scoreInt:Int = Int(String(etScore!.text!))!
            addScore!(scoreInt)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerL.text = player

    }
    

    func createPopUp(_ playerP:String,_ userIndexP:Int,completion:@escaping ()->()){
        
        player = playerP
        userIndex = userIndexP
        completion()
    }
    
    
    
}
