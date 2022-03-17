//
//  HomeViewController.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var addMoreImageView: UIImageView!
    @IBOutlet weak var addMoreStackView: UIStackView!
    @IBOutlet weak var backgroundView: UIView!
    
    private var addMoreVisible = false
    private var addMoreStackViewVisible = false
    private var backgroundViewVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddMoreVisibility()
        addMoreStackView.isHidden = true
        backgroundView.isHidden = true
    }
    
    private func setupAddMoreVisibility() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggleAddMoreVisibility))
        addMoreImageView.isUserInteractionEnabled = true
        addMoreImageView.addGestureRecognizer(tap)
    }
    
    @objc private func toggleAddMoreVisibility() {
        addMoreVisible.toggle()
        addMoreStackViewVisible.toggle()
        backgroundViewVisible.toggle()
        addMoreImageView.image = !addMoreVisible ? UIImage(systemName: "plus.app.fill") : UIImage(systemName: "xmark.app.fill")
        
        if addMoreStackViewVisible == false {
            addMoreStackView.isHidden = true
        } else {
            addMoreStackView.isHidden = false
        }
        
        if backgroundViewVisible == false {
            backgroundView.isHidden = true
        } else {
            backgroundView.isHidden = false
        }
        
    }
    
}
