//
//  ActivityService.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


typealias Handler<T> = (T?,Error?) -> ()

class ActivityService<T:Decodable>{
    
    
     func fetch(url:String, completion: @escaping Handler<T>){
        guard let URL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            if error != nil{
                completion(nil,error)
                return
            }
            
            guard let dataReceive = data else { return }
            do{
                let results = try JSONDecoder().decode(T.self, from: dataReceive)
            
                completion(results,nil)
            }catch{
                completion(nil,error)
                return
            }
            
        }.resume()
    }
}
