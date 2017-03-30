//
//  ProgramsTableViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/15/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class ProgramsTableViewController: UITableViewController {
    
    let programs: [[String]] = [["Monday - Friday", "07:00 - 08:00", "12:00 - 13:00"],
                                ["Monday - Sunday", "07:00 - 08:00", "12:00 - 13:00"],
                                ["Monday - Friday", "07:00 - 08:00", "10:00 - 11:00", "13:00 - 14:00", "16:00 - 17:00"],
                                ["Monday - Sunday","07:00 - 08:00", "10:00 - 11:00", "13:00 - 14:00", "16:00 - 17:00"],
                                ["Monday - Friday", "07:00 - 09:00", "12:00 - 14:00"],
                                ["Monday - Sunday", "07:00 - 09:00", "12:00 - 14:00"],
                                ["Monday - Friday", "07:00 - 10:00", "12:00 - 15:00"],
                                ["Monday - Sunday", "07:00 - 10:00", "12:00 - 15:00"],
                                ["Monday - Friday", "07:00 - 11:00", "13:00 - 17:00"],
                                ["Monday - Sunday", "07:00 - 11:00", "13:00 - 17:00"],
                                ["Monday - Friday", "07:00 - 09:00", "11:00 - 13:00", "15:00 - 17:00"],
                                ["Monday - Sunday", "07:00 - 09:00", "11:00 - 13:00", "15:00 - 17:00"],
                                ["Monday - Friday", "07:00 - 09:00", "10:00 - 12:00", "13:00 - 15:00", "16:00 - 17:00"],
                                ["Monday - Sunday", "07:00 - 09;00", "10:00 - 12:00", "13:00 - 15:00", "16:00 - 17:00"],
                                ["Monday - Friday", "07:00 - 09:00", "13:00 - 15:00", "19:00 - 21:00", "01:00 - 03:00"],
                                ["Monday - Sunday", "07:00 - 09:00", "13:00 - 15:00", "19:00 - 21:00", "01:00 - 03:00"],
                                ["Monday - Friday", "07:00 - 08:00", "12:00 - 13:00", "17:00 - 18:00", "22:00 - 23:00", "03:00 - 04:00"],
                                ["Monday - Sunday", "07:00 - 08:00", "12:00 - 13:00", "17:00 - 18:00", "22:00 - 23:00", "03:00 - 04:00"],
                                ["Monday - Friday", "07:00 - 11:00", "15:00 - 19:00", "23:00 - 03:00"],
                                ["Monday - Sunday", "07:00 - 11:00", "15:00 - 19:00", "23:00 - 03:00"],
                                ["Monday - Friday", "07:00 - 10:00", "14:00 - 17:00", "21:00 - 00:00", "04:00 - 05:00"],
                                ["Monday - Sunday", "07:00 - 10:00", "14:00 - 17:00", "21:00 - 00:00", "04:00 - 05:00"],
                                ["Monday - Friday", "07:00 - 09:00", "14:00 - 16:00", "21:00 - 23:00", "03:00 - 05:00"],
                                ["Monday - Sunday", "07:00 - 09:00", "14:00 - 16:00", "21:00 - 23:00", "03:00 - 05:00"],
                                ["Monday - Friday", "07:00 - 11:00", "12:00 - 16:00", "17:00 - 21:00", "01:00 - 05:00"],
                                ["Monday - Sunday", "07:00 - 11:00", "12:00 - 16:00", "17:00 - 21:00", "01:00 - 05:00"],
                                ["Monday - Friday", "07:00 - 11:00", "13:00 - 17:00", "19:00 - 23:00", "01:00 - 05:00"],
                                ["Monday - Sunday", "07:00 - 11:00", "13:00 - 17:00", "19:00 - 23:00", "01:00 - 05:00"],
                                ["Monday - Friday", "07:00 - 11:00", "14:00 - 18:00", "21:00 - 01:00", "04:00 - 05:00"],
                                ["Monday - Sunday", "07:00 - 11:00", "14:00 - 18:00", "21:00 - 01:00", "04:00 - 05:00"]]
    
    
   /* let programs: [[[String]]] = [[["Monday - Friday"], ["07:00 - 08:00", "12:00 - 13:00"]],
                                  [["Monday - Sunday"], ["07:00 - 08:00", "12:00 - 13:00"]],
                                  [["Monday - Friday"], ["07:00 - 08:00", "10:00 - 11:00", "13:00 - 14:00", "16:00 - 17:00"]],
                                  [["Monday - Sunday"], ["07:00 - 08:00", "10:00 - 11:00", "13:00 - 14:00", "16:00 - 17:00"]],
                                  [["Monday - Friday"], ["07:00 - 09:00", "12:00 - 14:00"]],
                                  [["Monday - Sunday"], ["07:00 - 09:00", "12:00 - 14:00"]],
                                  [["Monday - Friday"], ["07:00 - 10:00", "12:00 - 15:00"]],
                                  [["Monday - Sunday"], ["07:00 - 10:00", "12:00 - 15:00"]],
                                  [["Monday - Friday"], ["07:00 - 11:00", "13:00 - 17:00"]],
                                  [["Monday - Sunday"], ["07:00 - 11:00", "13:00 - 17:00"]],
                                  [["Monday - Friday"], ["07:00 - 09:00", "11:00 - 13:00", "15:00 - 17:00"]],
                                  [["Monday - Sunday"], ["07:00 - 09:00", "11:00 - 13:00", "15:00 - 17:00"]],
                                  [["Monday - Friday"], ["07:00 - 09:00", "10:00 - 12:00", "13:00 - 15:00", "16:00 - 17:00"]],
                                  [["Monday - Sunday"], ["07:00 - 09;00", "10:00 - 12:00", "13:00 - 15:00", "16:00 - 17:00"]],
                                  [["Monday - Friday"], ["07:00 - 09:00", "13:00 - 15:00", "19:00 - 21:00", "01:00 - 03:00"]],
                                  [["Monday - Sunday"], ["07:00 - 09:00", "13:00 - 15:00", "19:00 - 21:00", "01:00 - 03:00"]],
                                  [["Monday - Friday"], ["07:00 - 08:00", "12:00 - 13:00", "17:00 - 18:00", "22:00 - 23:00", "03:00 - 04:00"]],
                                  [["Monday - Sunday"], ["07:00 - 08:00", "12:00 - 13:00", "17:00 - 18:00", "22:00 - 23:00", "03:00 - 04:00"]],
                                  [["Monday - Friday"], ["07:00 - 11:00", "15:00 - 19:00", "23:00 - 03:00"]],
                                  [["Monday - Sunday"], ["07:00 - 11:00", "15:00 - 19:00", "23:00 - 03:00"]],
                                  [["Monday - Friday"], ["07:00 - 10:00", "14:00 - 17:00", "21:00 - 00:00", "04:00 - 05:00"]],
                                  [["Monday - Sunday"], ["07:00 - 10:00", "14:00 - 17:00", "21:00 - 00:00", "04:00 - 05:00"]],
                                  [["Monday - Friday"], ["07:00 - 09:00", "14:00 - 16:00", "21:00 - 23:00", "03:00 - 05:00"]],
                                  [["Monday - Sunday"], ["07:00 - 09:00", "14:00 - 16:00", "21:00 - 23:00", "03:00 - 05:00"]],
                                  [["Monday - Friday"], ["07:00 - 11:00", "12:00 - 16:00", "17:00 - 21:00", "01:00 - 05:00"]],
                                  [["Monday - Sunday"], ["07:00 - 11:00", "12:00 - 16:00", "17:00 - 21:00", "01:00 - 05:00"]],
                                  [["Monday - Friday"], ["07:00 - 11:00", "13:00 - 17:00", "19:00 - 23:00", "01:00 - 05:00"]],
                                  [["Monday - Sunday"], ["07:00 - 11:00", "13:00 - 17:00", "19:00 - 23:00", "01:00 - 05:00"]],
                                  [["Monday - Friday"], ["07:00 - 11:00", "14:00 - 18:00", "21:00 - 01:00", "04:00 - 05:00"]],
                                  [["Monday - Sunday"], ["07:00 - 11:00", "14:00 - 18:00", "21:00 - 01:00", "04:00 - 05:00"]]
                                 
    ] */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return programs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programTableCell", for: indexPath) as! ProgramsTableViewCell
        //cell.programSetImage.image = UIImage(named: "tick_blue.png")
        cell.dayLabel.text = programs[indexPath.row][0]
        cell.rowNumberLabel.text = "#\(indexPath.row + 1)"
        
        /*
        if (programs[indexPath.row].count == 3) {
            cell.timeLabel.text = (programs[indexPath.row][1] + ", " + programs[indexPath.row][2])
        }
        else if (programs[indexPath.row].count == 4) {
            cell.timeLabel.text = (programs[indexPath.row][1] + ", " + programs[indexPath.row][2] + ", " + programs[indexPath.row][3])
        }
        else if (programs[indexPath.row].count == 5) {
            cell.timeLabel.text = (programs[indexPath.row][1] + ", " + programs[indexPath.row][2] + ", " + programs[indexPath.row][3] + ", " + programs[indexPath.row][4])
        }
        */

        //------------------------------- Check print --------------------------------------------
        print("Number of intervals: ", programs[indexPath.row].count, "| indexPath: ", indexPath)
        //----------------------------------------------------------------------------------------
        
        var time = "" // Create a transition variable 'time' of program's time intervals
        for var i in 1..<programs[indexPath.row].count {
            time += (programs[indexPath.row][i] + "  ")
            i += 1
        }
        cell.timeLabel.text = time
        
        return cell
   
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultCellHeight = 52
        if (programs[indexPath.row].count > 4) {
            return 68
        }
        return CGFloat(defaultCellHeight)
    }
    
    
    // Deselect row after has been tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        print("Selected program: #", (indexPath.row + 1))
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
