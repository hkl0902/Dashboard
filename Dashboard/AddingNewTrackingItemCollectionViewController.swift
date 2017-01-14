//
//  AddingNewTrackingItemTableViewController.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/13/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit

class AddingNewTrackingItemCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static let CELL_TITLES = ["Name", "Question", "Answers", "Goal (Optional)", "Track Automatically"]

    var reload = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.red
        self.navigationItem.title = "new nav con"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddingNewTrackingItemCollectionViewController.cancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddingNewTrackingItemCollectionViewController.add))
        
        
        // register cells
        self.collectionView?.register(NewTrackingItemCollectionViewCell.self, forCellWithReuseIdentifier: "AddingNewTrackedItemCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if reload {
            self.collectionViewLayout.invalidateLayout()
            reload = false
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AddingNewTrackingItemCollectionViewController.CELL_TITLES.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item at")
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "AddingNewTrackedItemCell", for: indexPath) as! NewTrackingItemCollectionViewCell
        cell.title = AddingNewTrackingItemCollectionViewController.CELL_TITLES[indexPath.row]
        cell.frame.size = CGSize(width: collectionView.frame.width, height: cell.preferredHeight ?? 150)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cell = collectionView.cellForItem(at: indexPath) {
            return cell.frame.size
        }
        return CGSize(width: collectionView.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 8)
    }
    
    func cancel() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func add() {
        return
    }
}

class NewTrackingItemCollectionViewCell: UICollectionViewCell {
    var title: String? {
        didSet {
            self.layoutSubviews()
        }
    }
    
    var label: UILabel?
    
    var preferredHeight: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Label
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label?.text = title!
        label?.translatesAutoresizingMaskIntoConstraints = false
        self.label?.frame.size = self.label!.intrinsicContentSize
        self.label?.layer.borderColor = UIColor.cyan.cgColor
        self.contentView.addSubview(label!)
        
        if title != nil {
            switch title! {
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[0]:  //Name
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[1]:  //Question
                let textField = MaxTextField(frame: CGRect(x: (label?.frame.maxX)! + 8, y: (self.label?.frame.minY)!, width: self.frame.width - (self.label?.frame.maxX)! - 8, height: (self.label?.frame.height)!))
                textField.backgroundColor = UIColor(red: 0.969, green: 0.341, blue: 0.251, alpha: 1.00)
                textField.placeholder = "Title?"
                textField.textAlignment = .left
                textField.delegate = textField
                textField.autocorrectionType = .no
                //textField.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(textField)
                preferredHeight = textField.frame.height
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[2]:  //Answers
                
                // Common Options
                let commonOptionsView = UIView(frame: CGRect(x: (label?.frame.maxX)! + 8, y: (self.label?.frame.minY)!, width: self.frame.width - (self.label?.frame.maxX)! - 8, height: (self.label?.frame.height)!))
                commonOptionsView.backgroundColor = UIColor.brown
                //commonOptionsView.translatesAutoresizingMaskIntoConstraints = false
                
                // Yes/No Button
                let yes_noButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                yes_noButton.backgroundColor = UIColor.black
                yes_noButton.setTitle("Yes/No", for: .normal)
                yes_noButton.adjustsImageWhenHighlighted = true
                yes_noButton.frame.size = yes_noButton.intrinsicContentSize
                commonOptionsView.addSubview(yes_noButton)
                //yes_noButton.translatesAutoresizingMaskIntoConstraints = false
                
                // Tally Button
                let tallyButton = UIButton(frame: CGRect(x: yes_noButton.frame.maxX + 8, y: 0 , width: 100, height: 100))
                tallyButton.backgroundColor = UIColor.black
                tallyButton.setTitle("Tally", for: .normal)
                tallyButton.adjustsImageWhenHighlighted = true
                tallyButton.frame.size = tallyButton.intrinsicContentSize
                //tallyButton.translatesAutoresizingMaskIntoConstraints = false
                commonOptionsView.addSubview(tallyButton)
                
                // Sizing
                commonOptionsView.frame.size = CGSize(width: commonOptionsView.frame.size.width, height: tallyButton.frame.size.height)
                let labelWidth = label?.frame.size.width
                let _ = label?.frame.size.height
                label?.frame.size = CGSize(width: labelWidth!, height: commonOptionsView.bounds.size.height)
                label?.layer.borderColor = UIColor.black.cgColor
                label?.layer.borderWidth = 1
                
                // User Created
                let newUserCreatedOptions = AddingNewTrackingItemOptionsTableViewController(style: .plain)
                newUserCreatedOptions.tableView.frame.origin = CGPoint(x: 0, y: commonOptionsView.frame.height)
                self.contentView.addSubview(newUserCreatedOptions.tableView)
                self.contentView.addSubview(commonOptionsView)
                preferredHeight = commonOptionsView.frame.height + newUserCreatedOptions.tableView.frame.height
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[3]:  //Goal
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[4]:  //Track Automatically
                fallthrough
            default: break
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
