//
//  UIView+Extensions.swift
//  Minty
//
//  Created by Uzoh Okwara on 11/03/2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
