//
//  AppDelegate.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/12/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        navController = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        window?.rootViewController = navController
        /**
        setupData()
        let context = self.persistentContainer.viewContext
        if let items = try? context.fetch(TrackingItem.createFetchRequest()) {
            for i in items {
                print(i)
            }
        }
        deleteData()
        **/
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    // CoreDataTest
    func setupData() {
        let context = self.persistentContainer.viewContext
        // Tracking Items
        var t01: TrackingItem!
        var t02: TrackingItem!
        var t03: TrackingItem!
        if let t1 = NSEntityDescription.insertNewObject(forEntityName: "TrackingItem", into: context) as? TrackingItem {
            t1.hasGoal = false
            t1.isActive = true
            t1.name = "T1"
            t1.question = "What would you like to do 1?"
            t01 = t1
        }
        if let t2 = NSEntityDescription.insertNewObject(forEntityName: "TrackingItem", into: context) as? TrackingItem {
            t2.hasGoal = false
            t2.isActive = true
            t2.name = "T2"
            t2.question = "What would you like to do 2?"
            t02 = t2
        }
        if let t3 = NSEntityDescription.insertNewObject(forEntityName: "TrackingItem", into: context) as? TrackingItem {
            t3.hasGoal = false
            t3.isActive = true
            t3.name = "T2"
            t3.question = "What would you like to do 3?"
            t03 = t3
        }

        if let yes_no = NSEntityDescription.insertNewObject(forEntityName: "Options", into: context) as? Options {
            yes_no.count_1 = 0
            yes_no.count_2 = 0
            yes_no.count_3 = 0
            yes_no.count_4 = 0
            yes_no.count_5 = 0
            yes_no.option_1 = "Yes"
            yes_no.option_2 = "No"
            yes_no.option_3 = nil
            yes_no.option_4 = nil
            yes_no.option_5 = nil
            yes_no.question = t01
        }

        if let q2 = NSEntityDescription.insertNewObject(forEntityName: "Options", into: context) as? Options {
            q2.count_1 = 0
            q2.count_2 = 0
            q2.count_3 = 0
            q2.count_4 = 0
            q2.count_5 = 0
            q2.option_1 = "Q2_1"
            q2.option_2 = "Q2_2"
            q2.option_3 = "Q2_3"
            q2.option_4 = "Q2_4"
            q2.option_5 = "Q2_5"
            q2.question = t02
        }

        if let q3 = NSEntityDescription.insertNewObject(forEntityName: "Options", into: context) as? Options {
            q3.count_1 = 0
            q3.count_2 = 0
            q3.count_3 = 0
            q3.count_4 = 0
            q3.count_5 = 0
            q3.option_1 = "Q3_1"
            q3.option_2 = "Q3_2"
            q3.option_3 = "Q3_3"
            q3.option_4 = "Q3_4"
            q3.option_5 = "Q3_5"
            q3.question = t03
        }
        self.saveContext()
    }

    func deleteData() {
        let context = self.persistentContainer.viewContext
        if let options = try? context.fetch(Options.createFetchRequest()) {
            for option in options {
                context.delete(option)
            }
        }
        if let items = try? context.fetch(TrackingItem.createFetchRequest()) {
            for i in items {
                context.delete(i)
            }
        }
        self.saveContext()
    }

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Dashboard")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
