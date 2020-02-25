//
//  EnterUsersVC.swift
//  Greed
//
//  Created by Squid Rewards on 04/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class EnterUsersVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var players:[String] = [String]()
    
    
    @IBOutlet weak var errorL: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numPlayersStr = etAmountPlayers.text
        if(numPlayersStr!.isEqual(""))
        {
            return 0
        }
        else{
            let numPlayers:Int = Int(numPlayersStr!)!
            return numPlayers
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let i = indexPath.row
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",for: indexPath) as! PlayerCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setCell(i)
        cell.add=self.addUser

            return cell
        
    }
    
    
    @IBOutlet weak var etAmountPlayers: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func btnStartGame(_ sender: Any) {
        
        if(players.count == 0)
        {
            print("No Players")
            errorL.text="You have no entered any Players"
        }
        else{
            
            var count = 0
            while(count<players.count)
            {
                if(players[count].isEqual(""))
                {
                    print("No name entered for Player ",count+1)
                    errorL.text = "You have not entered names for all of the players"
                    return
                }
                count += 1
            }
            print("All names entered")
            GlobalV.amountUsers = players.count
            GlobalV.userList = players
            errorL.text=""
            
            let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let mainGameVC = mainStorybaord.instantiateViewController(withIdentifier: "MainGameVC") as? MainGameVC else{
                print("Cant find View Controller")
                return
            }
            
            present(mainGameVC, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        etAmountPlayers.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    

    func addUser(_ userName:String,_ userIndex:Int) -> () {
        
        //print("Add User",userName,userIndex)
        players[userIndex] = userName

        
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        tableView.reloadData()
        let numPlayersStr = etAmountPlayers.text
        if(numPlayersStr!.isEqual(""))
        {
            players = [String]()
        }
        else{
            let numPlayers:Int = Int(numPlayersStr!)!
            players = [String]()
            var count = 0
            while(count<numPlayers)
            {
                players.append("")
                count += 1
            }
        }

        
    }
}
