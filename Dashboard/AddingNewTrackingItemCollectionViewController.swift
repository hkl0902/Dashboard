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
        return AddingNewTrackingItemCollectionViewController.CELL_TITLES.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "AddingNewTrackedItemCell", for: indexPath) as! NewTrackingItemCollectionViewCell
        cell.title = AddingNewTrackingItemCollectionViewController.CELL_TITLES[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print(self.view.frame.width)
        return CGSize(width: self.view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func cancel() {
        let _ = self.navigationController?.popViewController(animated: true)
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
        self.addSubview(label!)
        
        if title != nil {
            switch title! {
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[0]:
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[1]:
                print(self)
                let textField = MaxTextField(frame: CGRect(x: (label?.frame.maxX)! + 8, y: (self.label?.frame.minY)!, width: self.frame.width - (self.label?.frame.maxX)! - 8, height: (self.label?.frame.height)!))
                textField.backgroundColor = UIColor(red: 0.969, green: 0.341, blue: 0.251, alpha: 1.00)
                textField.placeholder = "Title?"
                textField.textAlignment = .left
                textField.delegate = textField
                self.addSubview(textField)
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[2]:
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[3]:
                fallthrough
            case AddingNewTrackingItemCollectionViewController.CELL_TITLES[4]:
                fallthrough
            default: break
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
