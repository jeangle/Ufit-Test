//
//  SettingsTableViewCell.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/16/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var langSelectImage: UIImageView!
    var cellSelectedImage = "tick_blue.png"
    var cellUnselectedImage = "" //"radio_off_gray.png"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.langSelectImage.image = UIImage(named: self.cellSelectedImage)
            
        }
        else {
            self.langSelectImage.image = UIImage(named: self.cellUnselectedImage)
        }
        self.selectionStyle = UITableViewCellSelectionStyle.none // Keep background-color as 'none' for both selected and unselected state

    }

}
