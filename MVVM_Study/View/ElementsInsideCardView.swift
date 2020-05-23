//
//  ElementsInsideCardView.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 22/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ElementsInsideCardView:UIView,ReusableViewProtocol{
    
    var activity:Activity?{
        didSet{
            
            
            if let activity = activity, let price = activity.price, let participants = activity.participants{
                self.activityLabel.text = "☑️ \(activity.activity ?? "just relax" )"
                self.participantsLabel.text = "☑️ \(String(participants))"
                self.typeLabel.text = "☑️ \(activity.type ?? "just fun")"
                self.priceLabel.text = "☑️ \(String(price))"
                
            }
            
        }
    }
    lazy var activityLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Activity"
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var participantsLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Participants"
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var typeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Type"
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var priceLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Price"
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        
        addSubview(activityLabel)
        addSubview(participantsLabel)
        addSubview(typeLabel)
        addSubview(priceLabel)
        
    }
    
    func autoLayout() {
        participantsLabel.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 16).isActive = true
        typeLabel.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 16).isActive = true
        priceLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    override func didMoveToSuperview() {
        autoLayout()
    }
    
}

