//
//  DynamicValue.swift
//  MVVM_Study
//
//  Created by Marcos Kilmer on 21/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
// This is our Bind

import Foundation


class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}
//
//
//class DynamicValue<T>{
//    typealias CompletionHandler = ((T) -> Void)
//
//    var value:T{
//        didSet{
//            self.notify()
//        }
//    }
//
//    init(_ value:T) {
//        self.value = value
//    }
//
//    private var observers = [String:CompletionHandler]()
//
//    public func addObserver(_ observer:NSObject, completionHandler: @escaping CompletionHandler){
//        observers[observer.description] = completionHandler
//    }
//
//    public func AddAndNotify(observer:NSObject, completionHandler: @escaping CompletionHandler){
//        self.addObserver(observer, completionHandler: completionHandler)
//        self.notify()
//    }
//    private func notify(){
//        observers.forEach({$0.value(value)})
//    }
//
//    deinit {
//        observers.removeAll()
//    }
//}
