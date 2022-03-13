//
//  SettingTableViewCell.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
  
    @IBOutlet weak var settingsIcon: UIImageView!
    @IBOutlet weak var settingsLbl: UILabel!
    
    func setup(title: String, icon: UIImage) {
        settingsLbl.text = title
        settingsIcon.image = icon
    }
    
}
