//
//  LegalTableViewCell.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit

class LegalTableViewCell: UITableViewCell {

    @IBOutlet weak var legalLbl: UILabel!
    @IBOutlet weak var legalUrl: UIImageView!
    
    func setup(title: String) {
        legalLbl.text = title
    }
}
