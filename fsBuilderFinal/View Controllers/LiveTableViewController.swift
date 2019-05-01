//
//  LiveTableViewController.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/24/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit

class LiveTableViewController: UITableViewController {

    let players = ["R.Westbrook    PG                                    75.5",
                   "D.Lillard           PG                                    73.4",
                   "N.Jokic              C                                    75.5",
                   "P.George          SF                                    46.3",
                   "J.Murray          PG                                    45.3",
                   "J.Embiid             C                                    75.5",
                   "K.Leonard        SF                                    39.4",
                   "P.Siakam           PF                                    38.2",
                   "E.Kanter             C                                    37.6",
                   "K.Birch              PF                                    36.7",
                   "T.Harris            PF                                    36.6",
                   "L.Aldridge       PF                                      36",
                   "S.Napier            PG                                    33.8",
                   "K.Lowry            PG                                    33.3",
                   "J.Grant               PF                                    30.5",
                   "J.Butler             SG                                    29.9",
                   "R.HollisJ            PF                                    28.9",
                   "M.Harkless        SF                                    27.4",
                   "C.McCollum      PG                                    27.3",
                   "T.McConnell      PG                                    26.9",
                   "R.Kurucs             PF                                    26.8",
                   "S.Adams              C                                    26.6",
                   "C.LeVert             SG                                    25.4",
                   "J.Poeltl                 C                                    24.8",
                   "B.Simmons         PG                                    24.5",
                   "W.Barton          SF                                    24.3",
                   "D.DeRozan        SG                                    23.8",
                   "M.Gasol             C                                    22.9",
                   "D.Schroder       SG                                    22.8",
                   "S.Ibaka            PF                                    22.3",
                   "M.Morris          SG                                    21.9",
                   "G.Harris          SG                                    21.8",
                   "N.Powell          SF                                    21.7",
                   "P.Millsap        PF                                    21.7",
                   "D.Green            SG                                    21.5"]


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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rows", for: indexPath)
        
        cell.textLabel?.text = players[indexPath.row]

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
