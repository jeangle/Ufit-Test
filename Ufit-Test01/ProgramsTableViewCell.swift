//
//  ProgramsTableViewCell.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/17/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class ProgramsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rowNumberLabel: UILabel!
    @IBOutlet weak var programSetImage: UIImageView!
    
    var cellSelectedImage = "tick_blue.png"
    var cellUnselectedImage = "" //"radio_off_gray.png"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.programSetImage.image = UIImage(named: self.cellSelectedImage)
            
        }
        else {
            self.programSetImage.image = UIImage(named: self.cellUnselectedImage)
        }
        self.selectionStyle = UITableViewCellSelectionStyle.none // Keep background-color as 'none' for both selected and unselected state // Configure the view for the selected state
    }

}
