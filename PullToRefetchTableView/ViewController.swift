//
//  ViewController.swift
//  PullToRefetchTableView
//
//  Created by Anhdzai on 12/16/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = [Int](0...10)
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.addSubview(self.refreshControl)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "index", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        let number = 100
        array.append(number)
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

