//
//  ActivityCardView.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 22/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ActivityCardView:UIView,ReusableViewProtocol{

        
    lazy var dataSource = ActivityDataSource()
    lazy var service = ActivityService<Activity>()
   
     lazy var viewModel = ActivityViewModel(service: service, dataSource: self.dataSource, elements: self.elementsInsideCardView)
    
    lazy var buttonActivity:UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get Activity", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(buttonActivityDidTapped), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var elementsInsideCardView:ElementsInsideCardView = {
       let view = ElementsInsideCardView()
        return view
    }()
    
   
    
    
    @objc func buttonActivityDidTapped(){
    
        self.viewModel.fetchActivities()
        elementsInsideCardView.activity = viewModel.elements?.activity
       
        
    }
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
        layer.cornerRadius = 22
        backgroundColor = .yellow
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonActivity)
        addSubview(elementsInsideCardView)
    }
    
    func autoLayout() {
        buttonActivity.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        buttonActivity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        elementsInsideCardView.activityLabel.topAnchor.constraint(equalTo: buttonActivity.bottomAnchor, constant: 16).isActive = true
      
    }
    override func layoutSubviews() {
        print("layout")
    }
    
    override func didMoveToSuperview() {
        autoLayout()
    }
    
}
