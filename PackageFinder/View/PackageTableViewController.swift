//
//  PackageTableViewController.swift
//  PackageFinder
//
//  Created by Stefanini on 10/10/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import UIKit

class PackageTableViewController: UITableViewController {

    var package = [Event]()
    var codePackage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return package.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "packageCell", for: indexPath) as! PackageTableViewCell

        let package =  self.package[indexPath.row]
        cell.statusLabel.text = package.status
        cell.dateLabel.text = package.data
        cell.hourLabel.text = package.hora
        cell.localLabel.text = package.local

        return cell
    }
    
    func trackingPackage(withCode code: String) {
        Package().getPackage(withCode: code, handler: { result in
            self.package = result
            self.tableView.reloadData()
        }, errorHandler: { error in
            print(print)
        })
    }
}

extension PackageTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let code = self.codePackage, code.count == 13{
                self.trackingPackage(withCode: code)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.codePackage = searchText
    }
}
