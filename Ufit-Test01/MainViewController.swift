//
//  ViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 2/22/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView: MainViewController? = nil
    let sections = ["Main Menu", "Localization", "General Info"]
    let menuItems = [["Connection", "Device status", "Time", "Programs", "Manual program", "Password"], ["Settings"], ["Version"]]
    //var menuItems = ["Connection", "Device status", "Time", "Programs", "Manual program", "Password", "Settings"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK -- showDeviceStatus() alert function 
    @IBAction func showDeviceStatus(_ sender: Any) {
        // This action handler refers to 'failed' status
        let failedActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Ufit is not found", message: "Please, make sure the device is avallable and within Bluetooth connection efficiency.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        // Here should be added 3 action handlers that refer to 'ON', 'OFF' and 'Program' status:
        // let ondActionHandler = { (action:UIAlertAction!) -> Void in ...some code}
        // let offdActionHandler = { (action:UIAlertAction!) -> Void in ...some code}
        // let programdActionHandler = { (action:UIAlertAction!) -> Void in ...some code}
        
        
        let alertController = UIAlertController(title: "Choose device mode:", message: "Turn device On, Off or run by Program", preferredStyle: UIAlertControllerStyle.actionSheet)
        alertController.addAction(UIAlertAction(title: "Turn On", style: UIAlertActionStyle.default, handler: failedActionHandler))
        alertController.addAction(UIAlertAction(title: "Turn Off", style: UIAlertActionStyle.default, handler: failedActionHandler))
        alertController.addAction(UIAlertAction(title: "Program", style: UIAlertActionStyle.default, handler: failedActionHandler))
        present(alertController, animated: true, completion: nil)
        
        let callAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(callAction)
        
    }
   
    // MARK -- showPopup() function
    @IBAction func showPopup(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbDayTime") as! SetTimeViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    
    }

}

// MARK -- UITableViewController methods
extension MainViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.menuImage.image = UIImage(named: (menuItems[indexPath.section][indexPath.row] + ".png")) // 
        cell.menuLabel.text = menuItems[indexPath.section][indexPath.row]

        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
}
// MARK -- UITableViewDelegate methods
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         let menuItemSender = menuItems[indexPath.section][indexPath.row]
         /*
         // This piece of code deselects all rows but 'Device Status' which should be deselected on close alert message called by showDeviceStatus()
         if !(menuItemSender == menuItems[0][1]) {
              tableView.deselectRow(at: indexPath, animated: true)
         }
         */
        
         // 'Connection'
         if (menuItemSender == menuItems[0][0]) {
             performSegue(withIdentifier: "segConnection", sender: menuItemSender)
         }
        
         // 'Device Status'
         if (menuItemSender == menuItems[0][1]) {
             self.showDeviceStatus(self)
         }
        
         // 'Time'
         if (menuItemSender == menuItems[0][2]) {
             performSegue(withIdentifier: "segTime", sender: menuItemSender)
         }
        
         // 'Programs'
         if (menuItemSender == menuItems[0][3]) {
             performSegue(withIdentifier: "segProgramsTable", sender: menuItemSender)
         }
        
         // 'Manual Program'
         if (menuItemSender == menuItems[0][4]) {
             performSegue(withIdentifier: "segManualProgramTable", sender: menuItemSender)
         }
        
         // 'Password'
         if (menuItemSender == menuItems[0][5]) {
             performSegue(withIdentifier: "segPassword", sender: menuItemSender)
         }
        
         // 'Settings'
         if (menuItemSender == menuItems[1][0]) {
             performSegue(withIdentifier: "segSettingsTable", sender: menuItemSender)
         }
        
        // 'Version'
        if (menuItemSender == menuItems[2][0]) {
            performSegue(withIdentifier: "segVersion", sender: menuItemSender)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segConnection") {
            //let menuCellTapped = segue.destination as! ConnectionViewController
            //menuCellTapped.connection = sender as! String
            
        }
        if (segue.identifier == "segPrograms") {
            //let menuCellTapped = segue.destination as! ManualProgramViewController
            //menuCellTapped.view = sender as! UIView
        }

    }
}

