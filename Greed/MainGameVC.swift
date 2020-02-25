//
//  MainGameVC.swift
//  Greed
//
//  Created by Squid Rewards on 08/12/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit


class MainGameVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var rowNum:Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        rowNum = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoundCell") as! RoundCell
        cell.setCell(self,indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCount!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScoreCell", for: indexPath) as! ScoreCell
        
        print("Cell Reloaded")
        cell.setName("")
        if(rowNum == 0)
        {
            cell.setName(userList![indexPath.row])
        }
        else if(rowNum == rowCount-1)
        {
            cell.setTotal(scoreTotals[indexPath.row])
        }
        else if(rowNum == rowCount-2)
        {
            cell.setName("TOTAL")
        }
        else
        {
            if(indexPath.row<userScores.count)
            {
                print("No way")
                
                
                if(rowNum! <= userScores[indexPath.row].count)
                {
                    print("Jose ",userScores[indexPath.row][rowNum!-1])

                    
                    cell.setTotal(userScores[indexPath.row][rowNum!-1])
                }
                else{
                    print("Bring the noise ", rowNum,userScores[indexPath.row].count)
                }
            }
            
        }
        //cell.setCell(rowNum!,indexPath.row)
        
        return cell
    }
    

    
    var rowCount = 4
    
    var winnerIndex = 0
    
    var userCount:Int?
    var userIndex = 0;
    var userList:[String]?
    var hasWinner = false
    var reached5000 = false
    var noScoreYet = true
    var userScores = [[Int]]()
    var scoreTotals = [Int]()
    
    @IBOutlet weak var colelctionView: UICollectionView!
    
    
    @IBAction func addScore(_ sender: Any) {
        scorePopUp(userIndex)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        userList = GlobalV.userList
        userCount = GlobalV.amountUsers
        
        print("User Count" , userCount)
        
        for _ in 0...(userCount!-1)
        {
            userScores.append([0])
            scoreTotals.append(0)
        }
        
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        //scorePopUp(0)
        
        
        
    }
    

    
    func scorePopUp(_ index:Int)
    {
        //if(!hasWinner){
        
            let playerName = userList![index]
            let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let enterScoreVC = mainStorybaord.instantiateViewController(withIdentifier: "EnterScoreVC") as? EnterScoreVC else{
                print("Cant find View Controller")
                return
            }
            enterScoreVC.createPopUp(playerName, index, completion:{ () -> () in
                
                enterScoreVC.addScore = self.addScore
                self.present(enterScoreVC, animated: true, completion: nil)
            })
            
        //}
    }

    func addScore(_ score:Int) -> () {
        
        //print("Add User",userName,userIndex)

        dismiss(animated: true)

        var max = scoreTotals[userIndex]
        let playerName = userList![userIndex]

        max += score
        if(noScoreYet){print("Jose MOLE")
            userScores[userIndex][0] = score}
        else{userScores[userIndex].append(score)}
          
        
        scoreTotals[userIndex] = max
        
        if(max >= 5000 && !hasWinner)
        {
            hasWinner = true
            winnerIndex = userIndex
            let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let youWonVC = mainStorybaord.instantiateViewController(withIdentifier: "YouWonVC") as? YouWonVC else{
                print("Cant find View Controller")
                return
            }
            youWonVC.createPopUp(playerName, completion:{ () -> () in

                self.present(youWonVC, animated: true, completion: nil)
            })
        }
            userIndex = userIndex + 1
        if(userIndex == winnerIndex || userIndex == winnerIndex+userCount! && hasWinner)
            {
                createWinner()
            }
            if(userIndex == userCount){
                userIndex = 0
                rowCount += 1
                noScoreYet = false
                print("Row Added")
                
            }
           // scorePopUp(userIndex)
        
        let tempRowCount = rowCount
        
        rowCount = tempRowCount
        tableView.reloadData()
        print("Reload Table")
        
        
    }
    
    func createWinner(){
        
        var winnerIndex = 0
        var loopIndex = 0
        var highScore = 0
        
        while(loopIndex < userList!.count)
        {
            if(scoreTotals[loopIndex] > highScore)
            {
                winnerIndex = loopIndex
                highScore = scoreTotals[loopIndex]
            }
            
            loopIndex += 1
        }
        
        let winner = userList![winnerIndex]
        
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let youWonVC = mainStorybaord.instantiateViewController(withIdentifier: "YouActuallyWonVC") as? YouActuallyWonVC else{
            print("Cant find View Controller")
            return
        }
        youWonVC.createPopUp(winner, completion:{ () -> () in
            
            self.present(youWonVC, animated: true, completion: nil)
        })
    }
}
