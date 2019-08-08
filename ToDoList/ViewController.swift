//
//  ViewController.swift
//  ToDoList
//
//  Created by Teerawat Vanasapdamrong on 7/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private var tableView: UITableView!
  @IBOutlet private var textField: UITextField!
  
  var todoItems: [TodoItem] = []
  
  @IBAction func addTapped() {
    guard let title = textField.text, !title.isEmpty else {
      return
    }
    let todoItem = TodoItem(todoTitle: title)
    todoItems.append(todoItem)
    tableView.reloadData()
  }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoTableViewCell else {
      return UITableViewCell()
    }
    let todoItem = todoItems[indexPath.row]
    cell.setupCell(todoItem: todoItem)
    cell.delegate = self
    return cell
  }
}

extension ViewController: TodoTableViewCellDelegate {
  func checkButtonDidTapped(cell: TodoTableViewCell) {
    guard let index = tableView.indexPath(for: cell) else {
      return
    }
    let todoItem = todoItems[index.row]
    todoItem.isChecked = !todoItem.isChecked
    tableView.reloadData()
  }
}
