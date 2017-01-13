//
//  ViewController.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/12/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    lazy var trackedItems: [TrackingItem]? = {
        let request = TrackingItem.createFetchRequest()
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            return (try? context.fetch(request))
        }
        return nil
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.white
        self.navigationItem.title = "Home"
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView?.backgroundColor = UIColor.darkGray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(HomeViewController.beginAddingNewTrackingItem))
        
        // Register Reuse Identifier
        self.collectionView?.register(TrackedItemCell.self, forCellWithReuseIdentifier: "TrackedItemQuickViewCell")
        
        // testing
        self.beginAddingNewTrackingItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackedItems?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "TrackedItemQuickViewCell", for: indexPath) as! TrackedItemCell
        cell.title = trackedItems?[indexPath.row].question
        if cell.options == nil {
            cell.options = trackedItems?[indexPath.row].answerChoices?.optionsToArray()
        }
        if cell.counts == nil {
            cell.counts = trackedItems?[indexPath.row].answerChoices?.countsToArray()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // Selectors
    
    func beginAddingNewTrackingItem() {
        let addingVC = AddingNewTrackingItemCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(addingVC, animated: true)
    }
}

class TrackedItemCell: UICollectionViewCell {
    
    var title: String? {
        didSet {
            titleLabel?.text = title
            titleLabel?.textAlignment = .center
            titleLabel?.preferredMaxLayoutWidth = NSAttributedString(string: title!).size().width
        }
    }
    
    var options: [String]? {
        didSet {
            optionsTableViewController?.options = self.options
        }
    }
    var counts: [Int]? {
        didSet {
            optionsTableViewController?.counts = self.counts
        }
    }
    
    var titleLabel: UILabel?
    
    var optionsTableViewController: HomeOptionsTableViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.522, green: 0.596, blue: 0.110, alpha: 1.00)
        titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: self.frame.width * 0.33, height: self.frame.height))
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 50
        let layer = titleLabel?.layer
        layer?.backgroundColor = UIColor.clear.cgColor
        
        optionsTableViewController = HomeOptionsTableViewController()
        optionsTableViewController!.tableView.frame = CGRect(x: self.frame.width * 0.33 + 8, y: 0, width: self.frame.width * (1-0.33)-8, height: self.frame.height)
        optionsTableViewController!.tableView.layer.borderColor = UIColor.brown.cgColor
        
        addSubview(titleLabel!)
        addSubview(optionsTableViewController!.tableView)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





































