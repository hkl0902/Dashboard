//
//  AddingNewTrackingItemOptionsTableViewController.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/13/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit

class AddingNewTrackingItemOptionsTableViewController: UITableViewController, UITextFieldDelegate {

    // The options that the user is planning to connect to the tracking item being Created
    // Should be empty at first
    var userCreatedOptions: [String]? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UserCreatedOptionsTableViewCell.self, forCellReuseIdentifier: "New User Created Option")
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
        print(section)
        return (userCreatedOptions?.count ?? 0) + 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "New User Created Option", for: indexPath) as! UserCreatedOptionsTableViewCell

        if indexPath.row == (userCreatedOptions?.count ?? 0) {
            // This cell is where the user would type in the new option
            let button = UIButton(type: .contactAdd)
            button.frame.origin = CGPoint(x: 8, y: 8)
            cell.contentView.addSubview(button)
        } else {
            cell.contentView.addSubview(UIButton(type: .system))
            cell.layer.backgroundColor = UIColor.darkGray.withAlphaComponent(CGFloat(1.0/(Double(indexPath.row + 1)))).cgColor
            cell.isUserInteractionEnabled = false
        }
        cell.inputController = self
        return cell
    }



}

class UserCreatedOptionsTableViewCell: UITableViewCell {

    var textField: UITextField?

    var inputController: UITableViewController? {
        didSet {
            textField?.delegate = inputController as! UITextFieldDelegate?
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
