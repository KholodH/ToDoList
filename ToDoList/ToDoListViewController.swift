//
//  ViewController.swift
//  ToDoList
//
//  Created by administrator on 04/01/2022.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController  {
    
 
    var lists = [Todo]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let save = (UIApplication.shared.delegate as! AppDelegate).saveContext
 
    override func viewDidLoad() {
        super.viewDidLoad()
        save()
        fetchAllItems()
        tableView.reloadData()    }
    func fetchAllItems() {
             let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
             do {
                 let result = try context.fetch(itemRequest)
                 lists = result as! [Todo]
             }catch {
                 print(error)
             }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TodoTableViewCell
        cell.titleLabel.text = lists[indexPath.row].title
        cell.contentLabel.text = lists[indexPath.row].content
        guard let date = lists[indexPath.section].date else { return cell }
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .none
                cell.dateLabel.text = dateFormatter.string(from: date)

        return cell
    }

//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        performSegue(withIdentifier: "editItem", sender: indexPath)
//
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        lists.remove(at: indexPath.row)
//        tableView.reloadData()
//    }

}

extension ToDoListViewController: ToDoListSaveDelegate {
    func saveNewItem(title: String, note: String, date: Date) {
        let newItem = Todo(context: context)
        newItem.title = title
        newItem.content = note
        newItem.date = date
        //Saving Changes and Fetching the Data Again From Database and Reload the TableView
        save()
        fetchAllItems()
        tableView.reloadData()
    }
}
