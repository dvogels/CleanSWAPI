//
//  Coordinator.swift
//  Common
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

open class Coordinator: NSObject {
    
    private(set) var childCoordinators: [Coordinator] = []
        
    public override init() {}
    
    open func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    open func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    public func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    public func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            NSLog("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    public func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    public func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
}
