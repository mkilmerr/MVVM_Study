//
//  ActivityDataSource.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
// 

import UIKit
class GenericDataSource<T>:NSObject{
    var data:DynamicValue<[T]> = DynamicValue([])
}


class ActivityDataSource:GenericDataSource<Activity>,UITableViewDataSource{
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.value.count
//        return data.value.count
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCellID", for: indexPath) as! ActivityCell
        cell.activity = self.data.value[indexPath.row]
        return cell
    }
    
    
    
   
    
    
}
