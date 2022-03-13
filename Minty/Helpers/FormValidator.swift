//
//  FormValidator.swift
//  Minty
//
//  Created by Uzoh Okwara on 13/03/2022.
//

import Foundation

enum FormError: LocalizedError {
    case invalidPhone
    case invalidPassword
    
    var errorDescription: String? {
        switch self {
        case .invalidPhone: return "Please enter a valid phone number"
        case .invalidPassword: return "Please enter a valid password"
        }
    }
}

struct FormValidator {
    
    static func validPhone(_ phone: String) -> Error? {
        var phone = phone
        // check if user entered +234
        if phone.contains("+234") {
            phone = phone.replacingOccurrences(of: "+234", with: "0")
        }
        
        return phone.count == 11 ? nil : FormError.invalidPhone
    }
    
    static func validPassword(_ password: String) -> Error? {
        return password.trimmingCharacters(in: .whitespaces).count >= 6 ? nil : FormError.invalidPassword
    }
}
