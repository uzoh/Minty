//
//  SettingsViewController.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var itemArray: [Item] = [
        .init(title: "Profile", icon: UIImage(named: "Profile")!),
        .init(title: "Account Management", icon: UIImage(named: "AManager")!),
        .init(title: "Referrals", icon: UIImage(named: "Referral")!),
        .init(title: "Legal", icon: UIImage(named: "Legal")!),
        .init(title: "Help and Support", icon: UIImage(named: "HS")!),
        .init(title: "System", icon: UIImage(named: "System")!),
        .init(title: "Create Business Account", icon: UIImage(named: "ALoader")!),
        .init(title: "Logout", icon: UIImage(named: "LO")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
         }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
         let item = itemArray[indexPath.row]
         cell.setup(title: item.title, icon: item.icon )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = indexPath.row
        if indexPath == 3 {
            let controller = self.storyboard?.instantiateViewController(identifier: "LegalViewController") as! LegalViewController
            controller.title = "Legal"
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        else if indexPath == 5 {
            let controller = self.storyboard?.instantiateViewController(identifier: "SystemViewController") as! SystemViewController
            controller.title = "System"
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        else if indexPath == 7 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginViewController")
            UserDefaults.standard.removeObject(forKey: "loggedInUser")
            UserDefaults.standard.synchronize()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
        }
    }
}
