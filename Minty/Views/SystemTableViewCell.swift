//
//  SystemTableViewCell.swift
//  Minty
//
//  Created by Uzoh Okwara on 13/03/2022.
//

import UIKit

class SystemTableViewCell: UITableViewCell {

    @IBOutlet weak var systemLbl: UILabel!
    
    func setup(title: String) {
        systemLbl.text = title
    }

}
