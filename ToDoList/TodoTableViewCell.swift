//
//  TodoTableViewCell.swift
//  ToDoList
//
//  Created by Teerawat Vanasapdamrong on 7/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

protocol TodoTableViewCellDelegate: class {
  func checkButtonDidTapped(cell: TodoTableViewCell)
}

class TodoTableViewCell: UITableViewCell {
  
  @IBOutlet private var checkButton: UIButton!
  @IBOutlet private var titleLabel: UILabel!
  
  weak var delegate: TodoTableViewCellDelegate?
  
  func setupCell(todoItem: TodoItem) {
    self.titleLabel.text = todoItem.todoTitle
    checkButton.isSelected = todoItem.isChecked
  }
  
  @IBAction func checkButtonDidTapped() {
    delegate?.checkButtonDidTapped(cell: self)
  }
  
  deinit {
    print("\(self) deinit")
  }
}
