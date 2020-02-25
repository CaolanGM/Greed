//
//  YouActuallyWonVC.swift
//  Greed
//
//  Created by Squid Rewards on 18/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class YouActuallyWonVC: UIViewController {

    
    var player:String?
    
    
    @IBAction func newGame(_ sender: Any) {
        print("New Game")
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainGameVC = mainStorybaord.instantiateViewController(withIdentifier: "EnterUsersVC") as? EnterUsersVC else{
            print("Cant find View Controller")
            return
        }
        
        present(mainGameVC, animated: true, completion: nil)
    }
    
    @IBAction func rematch(_ sender: Any) {
        print("Rematch")
        
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainGameVC = mainStorybaord.instantiateViewController(withIdentifier: "MainGameVC") as? MainGameVC else{
            print("Cant find View Controller")
            return
        }
        
        present(mainGameVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var playerL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerL.text = player!
        // Do any additional setup after loading the view.
    }
    

 
    func createPopUp(_ playerP:String,completion:@escaping ()->()){
        
        player = playerP
        completion()
        
    }

}
