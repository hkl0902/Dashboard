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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.red
        self.navigationItem.title = "new nav con"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddingNewTrackingItemCollectionViewController.cancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddingNewTrackingItemCollectionViewController.add))
        
        // register cells
        self.collectionView?.register(NewTrackingItemCollectionViewCell.self, forCellWithReuseIdentifier: "AddingNewTrackedItemCell")
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of Items in Section")
        return AddingNewTrackingItemCollectionViewController.CELL_TITLES.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item at")
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "AddingNewTrackedItemCell", for: indexPath) as! NewTrackingItemCollectionViewCell
        cell.title = AddingNewTrackingItemCollectionViewController.CELL_TITLES[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print(frame)
        self.backgroundColor = UIColor.lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Label
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label?.text = title!
        self.label?.frame.size = self.label!.intrinsicContentSize
        self.label?.layer.borderColor = UIColor.cyan.cgColor
        self.contentView.addSubview(label!)
        
        if title != nil {
            switch title! {
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[0]:  //Name
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[1]:  //Question
                print(self)
                let textField = MaxTextField(frame: CGRect(x: (label?.frame.maxX)! + 8, y: (self.label?.frame.minY)!, width: self.frame.width - (self.label?.frame.maxX)! - 8, height: (self.label?.frame.height)!))
                textField.backgroundColor = UIColor(red: 0.969, green: 0.341, blue: 0.251, alpha: 1.00)
                textField.placeholder = "Title?"
                textField.textAlignment = .left
                textField.delegate = textField
                textField.autocorrectionType = .no
                self.addSubview(textField)
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[2]:  //Answers
                
                // Common Options
                let commonOptionsView = UIView(frame: CGRect(x: (label?.frame.maxX)! + 8, y: (self.label?.frame.minY)!, width: self.frame.width - (self.label?.frame.maxX)! - 8, height: (self.label?.frame.height)!))
                commonOptionsView.backgroundColor = UIColor.brown
                
                let yes_noButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                yes_noButton.backgroundColor = UIColor.black
                yes_noButton.setTitle("Yes/No", for: .normal)
                yes_noButton.adjustsImageWhenHighlighted = true
                yes_noButton.frame.size = yes_noButton.intrinsicContentSize
                commonOptionsView.addSubview(yes_noButton)
                
                let tallyButton = UIButton(frame: CGRect(x: yes_noButton.frame.maxX + 8, y: 0 , width: 100, height: 100))
                tallyButton.backgroundColor = UIColor.black
                tallyButton.setTitle("Tally", for: .normal)
                tallyButton.adjustsImageWhenHighlighted = true
                tallyButton.frame.size = tallyButton.intrinsicContentSize
                commonOptionsView.addSubview(tallyButton)
                
                // User Created
                let newUserCreatedOptions = AddingNewTrackingItemOptionsTableViewController(style: .plain)
                
                self.contentView.addSubview(newUserCreatedOptions.tableView)
                self.contentView.addSubview(commonOptionsView)
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
