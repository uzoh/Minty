//
//  SystemViewController.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit

enum AppAppearance: String {
    case defaultMode = "Default"
    case lightMode = "Light Mood"
    case darkMode = "Dark Mood"
    
    var mode: UIUserInterfaceStyle {
        switch self {
        case .defaultMode:
            return .unspecified
        case .lightMode:
            return .light
        case .darkMode:
            return .dark
        }
    }
}

class SystemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var itemArray: [AppAppearance] = [.defaultMode, .lightMode, .darkMode]
    var selectedItem: AppAppearance = .defaultMode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
    }
    
    private func setAppearance() {
        let currentAppearance = UIScreen.main.traitCollection.userInterfaceStyle
        switch currentAppearance {
        case .light:
            selectedItem = .lightMode
        case .dark:
            selectedItem = .darkMode
        default:
            selectedItem = .defaultMode
        }
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemTableViewCell", for: indexPath) as! SystemTableViewCell
        let item = itemArray[indexPath.row]
        cell.setup(title: item.rawValue)
        cell.accessoryType = item == selectedItem ? .checkmark : .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let window = UIApplication.shared.keyWindow
        selectedItem = itemArray[indexPath.row]
        window?.overrideUserInterfaceStyle = selectedItem.mode
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Appearance"
    }
}
