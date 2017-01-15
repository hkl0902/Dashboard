//
//  HomeOptionsTableViewController.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/12/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit

/**
    In the Home View, shows the relative amount of each option in a stacked bar graph
 */
class HomeOptionsTableViewController: UITableViewController {

    // Names of the options
    var options: [String]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    // Counts associated with each option
    var counts: [Int]? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = false

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionsInTableViewCell")
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
        return options?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsInTableViewCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.backgroundColor = UIColor(red: CGFloat(1.0/(Double(indexPath.row) + 1.0)), green: CGFloat(1.0/(Double(indexPath.row) + 1.0)), blue: CGFloat(1.0/(Double(indexPath.row) + 1.0)), alpha: 1)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let fullHeight = tableView.frame.height
        let totalCount = counts?.reduce(0, +) // Finds the sum
        if let count = counts?[indexPath.row] {
            return fullHeight * CGFloat(Double(count)/Double(totalCount!))
        }
        return 0
    }


}
