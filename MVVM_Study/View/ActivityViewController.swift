//
//  ActivityViewController.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ActivityViewController:UIViewController{
 
    lazy var activityView: ActivityView = {
        let activityView = ActivityView(frame: .zero)
        
        return activityView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = activityView
    }
}
//
//class ActivityViewController:UITableViewController{
//    let dataSource = ActivityDataSource()
//    let service = ActivityService<Activity>()
//
//
//    lazy var viewModel:ActivityViewModel = {
//        let viewModel = ActivityViewModel(dataSource: self.dataSource)
//        return viewModel
//
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//        tableView.dataSource = self.dataSource
//
//        tableView.register(ActivityCell.self, forCellReuseIdentifier: "ActivityCellID")
//      self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
//          self?.tableView.reloadData()
//
//      }
//
//       self.viewModel.fetchActivities()
//
//
//
//
//    }
//
//}
