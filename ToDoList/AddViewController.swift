//
//  AddViewController.swift
//  ToDoList
//
//  Created by administrator on 04/01/2022.
//

import UIKit

class AddViewController: UIViewController {
    weak var delegate: ToDoListSaveDelegate?
    @IBOutlet weak var titleTextFeild: UITextField!
    
    @IBOutlet weak var dataPicker: UIDatePicker!
  
    @IBOutlet weak var contentTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItemButton(_ sender: UIButton) {
      
                   guard let title = titleTextFeild.text else { return }
                   guard let note = contentTextFeild.text else { return }
                   let date = dataPicker.date
        delegate?.saveNewItem(title: title, note: note, date: date)
                   //Back To Main View
        
        dismiss(animated: true, completion: nil)               }


}
