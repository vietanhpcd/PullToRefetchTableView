//
//  TableViewController.swift
//  PullToRefetchTableView
//
//  Created by Anhdzai on 12/16/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var array = [Int](0...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "index", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        // Khi kéo load lại dữ liệu thì thêm phần tử vào mảng
//        let dataArray: Int = 100
//        array.append(dataArray)
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}
