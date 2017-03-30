//
//  SetManualProgramViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 2/27/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

protocol SetManualProgramViewControllerDelegate: class {
    func enableAddButton()
    func setTimeLabelValue(_ time: String, _ program: [String])
}

class SetManualProgramViewController: UIViewController {
    // -------- Variables -------------------------------------
    weak var delegate: SetManualProgramViewControllerDelegate?
    var setFlag = 0
    var program: [String] = []
    
    @IBOutlet weak var hidePopupButton: UIButton!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    // --------------------------------------------------------
    
    @IBAction func timePickerValueChanges(_ sender: Any) {
         timeLabelText()
    }

    @IBAction func hidePoUp(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        
        // Uncomment this line if animation functions not applied
        // self.view.removeFromSuperview()

    }
    
    @IBAction func setManualProgram(_ sender: Any) {
       
        setFlag = setFlag + 1  // Set counter flag
        
        if setFlag == 1 {
            fromLabel.text = "To:" // Change fromLabel text "From" -> "To"
            program.append(timeLabel.text!) // Add time "From" to program array
        }
        
        if setFlag > 1 {
           self.removeAnimate()
           program.append(timeLabel.text!) // Add time "To" to program array
           // Pass print-friendly time format to timeLabel of Manual Program view controller !!
           let time = "From: " + program[0] + " - " + "to: " + program[1]
           delegate?.setTimeLabelValue(time, program)
        }
        // ----- Check print --------------
        print("From setManualProgram():")
        print(program)
        print(setFlag)
        // --------------------------------
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.3)
        self.showAnimate()
        timeLabelText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK -- Time label function
    func timeLabelText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeLabel.text! = formatter.string(from: timePicker.date)
        //formatter.dateFormat = "mm"
        //minutesLabel.text! = formatter.string(from: timePicker.date)
        
    }
    
    // MARK -- Animate functions
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.10, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.10, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.delegate?.enableAddButton() // Enable 'Add' button of ManualProgramViewController after animation finished
                self.view.removeFromSuperview()
            }
        });
    }
    
}

