//
//  LegalViewController.swift
//  Minty
//
//  Created by Uzoh Okwara on 12/03/2022.
//

import UIKit
import SafariServices

class LegalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemArray: [LegalItem] = [
        .init(title: "Mintyn Account - Terms & Conditions", url: "https://google.com"),
        .init(title: "Minty Privacy Policy", url: "https://apple.com"),
        .init(title: "Saving Goal - Terms & Conditions", url: "https://facebook.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LegalTableViewCell", for: indexPath) as! LegalTableViewCell
        let item = itemArray[indexPath.row]
        cell.setup(title: item.title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        // This connects the safari
        guard let url = URL(string: item.url)
        else {return}
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
    
}
