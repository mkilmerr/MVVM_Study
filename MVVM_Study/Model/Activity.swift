//
//  Activity.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct Activity:Decodable{
    
    let activity:String?
    var accessibility:Double?
    let type:String?
    let participants:Int?
    let price:Double?
    let link:String?
    let key:String?
}


struct ActivityArray:Decodable {
    let activity : [Activity]?
}

