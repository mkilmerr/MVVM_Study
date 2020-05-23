//
//  ActivityView.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 22/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ActivityView:UIView,ReusableViewProtocol{
    
    lazy var label:UILabel = {
       let lbl = UILabel()
        lbl.text = "Bored API"
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var cardView:ActivityCardView = {
        let view = ActivityCardView(frame: .zero)
        
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        print(self.cardView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addView()
        
        backgroundColor = .cyan

        
    }
    
    func addView(){
        addSubview(label)
        addSubview(cardView)
    }
    
    func autoLayout(){

        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        cardView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 16).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    
    override func didMoveToSuperview() {
        autoLayout()
    }
    
}
