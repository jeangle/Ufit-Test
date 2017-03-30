//
//  ManualProgramTableViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/13/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class ManualProgramTableViewController: UITableViewController {
    
    var times: [String] = [] // Stores same data as 'programs' plus "From", "-", "To" text elements
    var programs: [[String]] = [] // Stores data as array of programs ["Program 01", "Program 02", "Program 03"]

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addManualProgramButton: UIBarButtonItem!
    @IBOutlet weak var editManualProgramButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        /*
        // Make toolbar visible (If UITableViewController is imbedded in UINavigationController, the navigation controller comes with a toolbar) !!
        self.navigationController!.setToolbarHidden(false, animated: true)
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.editManualProgram(_:)))
        self.navigationController!.setToolbarItems([editButton], animated: true)
        //editButton.isEnabled = true
        */
        if (!times.isEmpty) {
            editManualProgramButton.isEnabled = true // Inable 'Edit' button
            timeLabel.text = "Monday - Sunday"
            print("Monday - Sunday (from viewDidLoad()!")
        }
        else {
            editManualProgramButton.isEnabled = false // Disable 'Edit' button
            timeLabel.text = "Not any Manual Program"
            //title = "No Manual Program" // Set title to "No Manual Program" on view load
            //self.times.append("No Manual Programs")
            print("Not any Manual Program (from viewDidLoad()!")
        }
        print(times)
        self.tableView.reloadData() // Check for table updates

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editManualProgram(_ sender: UIBarButtonItem) {
        self.isEditing = !self.isEditing
        if (self.isEditing) {
             editManualProgramButton.title = "Done"
        }
        else {
            editManualProgramButton.title = "Edit"
        }
    }
    
    @IBAction func showPopUp(_ sender: Any) {
        addManualProgramButton.isEnabled = false // Disable 'Add' button
        // Instantiate new view controller
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbSetManualProgram") as! SetManualProgramViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        popOverVC.delegate = self // Instantiate Set Manual Program delegate
        // Temporarily commented: change edit mode to false and edit button title to 'Edit' on 'Add' button click ???
        //self.isEditing = false
        //editManualProgramButton.title = "Edit"
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "manualProgramCell", for: indexPath)
        if (!programs.isEmpty) {
            cell.textLabel?.text = ("From: " + programs[indexPath.row][0] + "   -   " + "to: " + programs[indexPath.row][1])
            editManualProgramButton.isEnabled = true
            timeLabel.text = "Monday - Sunday"
        }
        else {
            //cell.textLabel?.text = "There is not any Manual Program" // Stopped working after weak var tableView was created !!
            timeLabel.text = "Not any Manual Program"
            print("Not any Manual Program")
        }
        self.isEditing = false // Temporarily commented out instead of uncommented lines in showPopUp(). This makes to disable edit mode on 'Add' button click !!
        editManualProgramButton.title = "Edit"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            programs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if (programs.isEmpty){
                editManualProgramButton.isEnabled = false
                editManualProgramButton.title = "Edit"
                timeLabel.text = "Not any Manual Program"
            }
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let programToMove = self.programs[sourceIndexPath.row]
        programs.remove(at: sourceIndexPath.row)
        programs.insert(programToMove, at: destinationIndexPath.row)
    }
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK -- Set Manual Program delegate methods
extension ManualProgramTableViewController: SetManualProgramViewControllerDelegate {
    func enableAddButton() {
        addManualProgramButton.isEnabled = true
    }
    
    func setTimeLabelValue(_ time: String, _ program: [String]) { // Variable 'time' stores same data as 'program' plus "From: ", " - ", "to: " text elements
        timeLabel.text = time // timeLabel changes its 'time' text value each second click on 'Set' button
        self.times.append(time)
        self.programs.append(program)
        self.tableView.reloadData()
        //title = "Manual Program" // Set title to "Manual Program" on add a first program to the programs array
        // ----- Check log ---------------
        print("From setTimeLabelValue():")
        print(times)
        print(programs)
        print(program)
        // -------------------------------
    }
    
}

