////
////  SwipeTableViewController.swift
////  
////
////  Created by Станислав Коцарь on 01.02.2018.
////
//
//import UIKit
//import SwipeCellKit
//
//class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//    }
//
//    // MARK: - Table view datasource methods
//    
//
//    
//    
//        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//            guard orientation == .right else { return nil }
//            
//            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
//                print("Item deleted")
//                
////                if let category = self.categoryArray?[indexPath.row] {
////                    do {
////                        try self.realm.write {
////                            self.realm.delete(category)
////                        }
////                    } catch {
////
////                    }
////                }
//                
//            }
//            // customize the action appearance
//            deleteAction.image = UIImage(named: "delete-icon")
//            return [deleteAction]
//        }
//        
//        func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
//            var options = SwipeTableOptions()
//            options.expansionStyle = .destructive
//            return options
//        }
//
//}

