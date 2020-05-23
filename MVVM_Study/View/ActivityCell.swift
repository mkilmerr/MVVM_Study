//
//  ActivityCell.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    var activity:Activity?{
        didSet{
            if let activity = activity{
                activityLabel.text = activity.activity
            }
        }
    }
    
    lazy var activityLabel:UILabel = {
       let lbl = UILabel()
        lbl.textColor = .blue
        lbl.backgroundColor = .red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(activityLabel)
        activityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
