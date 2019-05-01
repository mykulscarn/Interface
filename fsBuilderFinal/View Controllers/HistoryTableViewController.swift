//
//  HistoryTableViewController.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/24/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    let lineups = ["P.Mills - 17.6, D.Lillard - 73.4","D.Schroder - 22.9, G.Harris - 21.9","J.Harris - 17.4, P.George - 46.3","K.Birch - 36.7, A.Aminu - 18.5","J.Embiid - 42.6","What went wrong? J. Harris(17.1)","for  N.Powell(21.8)","C.Paul - 60.1, G.Hill - 12.2"," D.Mitchell - 44.4, S.Brown - 33.6","G.Antetokounmpo - 70.3, J.Crowder - 34.3", "D.Wilson - 7.2, D.Favors - 32.7", "C.Capela - 14.4","What went wrong? C.Capela(14.4)","for  B.Lopez(30.5)","R.Jackson - 34.2, S.Dinwiddie - 23.8", "J.Harden - 58.8, S.Brown - 16.3",  "R.Gay - 11.2, G.Antetokounmpo - 29.5", "R.Jefferson - 13.1, T.Harris - 48.6", "J.Allen - 40.6","What went wrong? R.Gay(11.2)", "for  J.Harris(22.2)"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lineups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowsHistory", for: indexPath)
        
        cell.textLabel?.text = lineups[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
