//
//  ActivityViewModel.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct ActivityViewModel {
    
    weak var dataSource:GenericDataSource<Activity>?
    var service = ActivityService<Activity>()
    var elements:ElementsInsideCardView?
    
    init(service:ActivityService<Activity>? = ActivityService<Activity>(),dataSource:GenericDataSource<Activity>?, elements:ElementsInsideCardView?) {
        self.dataSource = dataSource
        self.service = service!
        self.elements = elements
        
    }
    
    func fetchActivities(){
        
        self.service.fetch(url: "https://www.boredapi.com/api/activity") { (activity, error) in
            if let activity = activity{
                DispatchQueue.main.async {
                   
                    self.dataSource?.data.value = [activity]
                    self.elements?.activity = activity
                  
                }
            }
        }
    }

}

