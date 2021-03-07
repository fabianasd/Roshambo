//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Fabiana Petrovick on 05/03/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Properties
    
    var match: RPSMatch!
    var histories = [RPSMatch]()
    
    //MARK: Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyInCell", for: indexPath)
        let history = self.histories[(indexPath as NSIndexPath).row]
        
        // Set the name
        if( history.p1 == history.p2) {
            cell.textLabel?.text = "Tie"
        } else {
            cell.textLabel?.text = history.p1.defeats(history.p2) ? "Win!" : "Lose"
        }
        
        // If the cell has a detail label, we will put the evil scheme in.
        if cell.detailTextLabel != nil {
            cell.detailTextLabel?.text = history.winner.description + " vs. " + history.loser.description
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
