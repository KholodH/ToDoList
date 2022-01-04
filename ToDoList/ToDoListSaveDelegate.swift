//
//  ToDoListSaveDelegate.swift
//  ToDoList
//
//  Created by administrator on 04/01/2022.
//

import UIKit

protocol ToDoListSaveDelegate: AnyObject {
    func saveNewItem(title: String, note: String, date: Date)
}
