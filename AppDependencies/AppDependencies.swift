//
//  AppDependencies.swift
//  AppDependencies
//
//  Created by Gujgiczer Máté on 2016. 10. 22..
//  Copyright © 2016. gujci. All rights reserved.
//

import Foundation
import EventEmitter

// MARK: - Events
public enum DependenciEvents: String, Event {
    case dependencyAdded
}

// MARK: - Injectable protocolts
public protocol Injectable: class {
    static var id: String {get}
    static func create() -> Self
}

// MARK: - AppDependencies
open class Dependencies: EventEmitter {
    public static var shared = Dependencies()
    
    public var listeners: [String: [Any]]? = [:]
    fileprivate var presenters: [String: [Injectable]] = [:]
}

// MARK: - Injectable dependencies
public extension Dependencies {
    
    public func request<T: Injectable>() -> T {
        if let old = presenters[T.id]?.last as? T {
            return old
        }
        return new()
    }
    
    public func new<T: Injectable>() -> T {
        let newModule = T.create()
        presenters[T.id] = [newModule]
        emit(DependenciEvents.dependencyAdded, information: T.id)
        return newModule
    }
    
    public func push<T: Injectable>() -> T {
        if let _ = presenters[T.id] as? [T] {
            let newModule = T.create()
            presenters[T.id]?.append(newModule)
            return newModule
        }
        return new()
    }
    
    public func pop<T: Injectable>() -> T? {
        return presenters[T.id]?.popLast() as? T
    }
    
    public func safePop<T: Injectable>() -> T {
        if presenters[T.id]?.count ?? 0 > 0 {
            return presenters[T.id]?.popLast() as! T
        }
        return request()
    }
}