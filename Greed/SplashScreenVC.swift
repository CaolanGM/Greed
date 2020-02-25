//
//  SplashScreenVC.swift
//  Greed
//
//  Created by Squid Rewards on 21/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class SplashScreenVC: UIViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scheduledTimerWithTimeInterval()

        
    }
    
    
    func scheduledTimerWithTimeInterval(){
        
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.moveScreen), userInfo: nil, repeats: false)
        
    }
    @objc func moveScreen(){
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let youWonVC = mainStorybaord.instantiateViewController(withIdentifier: "EnterUsersVC") as? EnterUsersVC else{
            print("Cant find View Controller")
            return
        }
        
            self.present(youWonVC, animated: true, completion: nil)
        

    }

}
