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
        
        // Register Reuse Identifier
        self.collectionView?.register(TrackedItemCell.self, forCellWithReuseIdentifier: "TrackedItemQuickViewCell")
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
        cell.title = trackedItems?[indexPath.row].name
        if cell.options == nil {
            cell.options = trackedItems?[indexPath.row].answerChoices?.optionsToArray()
        }
        if cell.counts == nil {
            cell.counts = trackedItems?[indexPath.row].answerChoices?.countsToArray()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.9, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

class TrackedItemCell: UICollectionViewCell {
    
    var title: String? {
        didSet {
            titleLabel?.text = title
            titleLabel?.textAlignment = .center
            titleLabel?.preferredMaxLayoutWidth = NSAttributedString(string: title!).size().width
            titleLabel?.backgroundColor = UIColor(red: 0.235, green: 0.541, blue: 0.776, alpha: 1.00)
        }
    }
    
    var options: [String]?
    var counts: [Int]?
    
    var titleLabel: UILabel?
    
    var optionsTableViewController: HomeOptionsTableViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.082, green: 0.537, blue: 0.788, alpha: 1.00)
        titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: self.frame.width * 0.33, height: self.frame.height - 16))
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 50
        
        optionsTableViewController = HomeOptionsTableViewController()
        addSubview(titleLabel!)
        addSubview(optionsTableViewController!.tableView)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





































