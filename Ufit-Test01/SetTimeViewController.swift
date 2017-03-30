//
//  TimeViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 2/22/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

protocol SetTimeViewControllerDelegate: class {
    func enableManualTimeButton()
    func setDayTimeLabelValue(_ day: String, _ time: String)
}

class SetTimeViewController: UIViewController {
    
    weak var delegate: SetTimeViewControllerDelegate?
    
    var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    
    @IBOutlet weak var hidePopupButton: UIButton!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func timePickerValueChanged(_ sender: Any) {
        timeLabelText() 
        
    }
    
    @IBAction func hidePopUp(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        // Uncomment this line if animation functions not applied
        // self.view.removeFromSuperview()
    }
    
    // MARK -- Set Day & Time by click 'Set' button
    @IBAction func setDayTime(_ sender: Any) {
        self.removeAnimate()
        // The rest of code to set Day/Time
        let day = dayLabel.text!
        let time = timeLabel.text!
        self.delegate?.setDayTimeLabelValue(day, time)
        // ----- Check print --------------------------------
        let dayTimeArray = [dayLabel.text!, timeLabel.text!]
        print(dayTimeArray)
        // --------------------------------------------------
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set alpha component for the view
        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.3)
        self.showAnimate()  // Show popup with Picker View
        
        dayLabel.text = daysOfWeek[0] // Show day of week on 'dayLabel'
        timeLabelText() // Show time on 'timeLabel'
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK -- timeLabelText function
    func timeLabelText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeLabel.text! = formatter.string(from: timePicker.date)
        
    }
    
    // MARK -- Animate functions
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.delegate?.enableManualTimeButton() // Enable 'Manual' button of TimeViewController after animation finished
                self.view.removeFromSuperview()
            }
        });
    }
    
}

   // MARK -- Set Picker View Data Source methods
extension SetTimeViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return daysOfWeek.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return daysOfWeek[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dayLabel.text = daysOfWeek[row]
    }
    
}











