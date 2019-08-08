//
//  TodoItem.swift
//  ToDoList
//
//  Created by Teerawat Vanasapdamrong on 7/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation

class TodoItem {
  var todoTitle: String
  var todoDescription: String?
  var isChecked: Bool = false
  
  init(todoTitle: String) {
    self.todoTitle = todoTitle
    print("\(self) init")
  }
  
  deinit {
    print("\(self) deinit")
  }
}
