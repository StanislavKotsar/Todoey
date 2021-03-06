//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Станислав Коцарь on 25.01.2018.
//  Copyright © 2018 Станислав Коцарь. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework


class CategoryViewController: SwipeTableViewController {

    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
    override func viewDidLoad() {
        
        loadCategories()
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    
    
    
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        guard let backgroundColor = categoryArray?[indexPath.row].color else {
            fatalError()
        }
        
        cell.backgroundColor = UIColor(hexString: backgroundColor)
        
        cell.textLabel?.textColor = ContrastColorOf(UIColor(hexString: backgroundColor)!, returnFlat: true)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories added yet"
        
        
        return cell
        
    }
    
    // MARK: - SwipeTableViewCellDelegate methods
    
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
            
        }
        
        
    }
    
    // MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        do{
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    
    func loadCategories() {
        
        categoryArray = realm.objects(Category.self)

        tableView.reloadData()
        
    }
    // MARK: - Delete Data From Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let category = self.categoryArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(category)
                }
            } catch {

            }
        }
    }
    
    // MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldText = UITextField()
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let category = Category()
            category.name = textFieldText.text!
            category.color = UIColor.randomFlat.hexValue()
            self.save(category: category)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextFiled) in
            alertTextFiled.placeholder = "Create new category"
            textFieldText = alertTextFiled
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}



