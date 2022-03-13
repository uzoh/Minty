//
//  NetworkService.swift
//  Minty
//
//  Created by Uzoh Okwara on 13/03/2022.
//

import Foundation

class NetworkService {
    
    static var shared = NetworkService()
    private init() {}
    
    func login(phone: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async { // execute network call outside the main thread
            
            sleep(3)
            DispatchQueue.main.async { // jump back to the main thread to update UI
                if phone == "08130000000" && password == "password"{
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}
