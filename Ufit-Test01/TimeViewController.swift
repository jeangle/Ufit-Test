//
//  TimeViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/2/17.
//  Copyright © 2017 JSD. All rights reserved.
//
import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var dayTimeLabel: UILabel!
    @IBOutlet weak var iPhoneTimeButton: UIButton!
    @IBOutlet weak var manualTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK -- Synchronize Ufit's timer with iPhone
    @IBAction func synchiPhone(_ sender: Any) {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE HH:mm"
        dayTimeLabel.text = formatter.string(from: now)
        //dayTimeLabel.text = "Hello from iPhone!"
    }
    
    // MARK -- Show PopUP by click manualTimeButton
    @IBAction func showPopUp(_ sender: Any) {
        // Instantiate new view controller
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbDayTime") as! SetTimeViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        popOverVC.delegate = self // Instantiate SetTimeViewController delegate
        
        manualTimeButton.isEnabled = false // Disable 'Add' button
        // Change edit mode to false and edit button title to 'Edit' when 'Add' button tapped ???
        self.isEditing = false
    }

}

     // MARK -- Set Time delegate methods
extension TimeViewController: SetTimeViewControllerDelegate {
    // Disable 'Manual' button to prevent multiple popups
    func enableManualTimeButton() {
        manualTimeButton.isEnabled = true
    }
    // Send data to Day/Time label by 'Set' button click
    func setDayTimeLabelValue(_ day: String, _ time: String) {
        dayTimeLabel.text = day + " " + time
    }
    
}

