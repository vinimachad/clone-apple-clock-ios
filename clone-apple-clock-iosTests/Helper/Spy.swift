//
//  Spy.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

import Foundation

@propertyWrapper
struct Spy<Value> {
    
    private(set) var value: Value
    private(set) var history: [Value]
    
    var count: Int {
        history.count
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            history.append(newValue)
            value = newValue
        }
    }
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
        self.history = []
    }
    
    public var projectedValue: Self {
        get { self }
        set { self = newValue }
    }
}

extension Spy where Value: ExpressibleByNilLiteral {
    init() {
        self.init(wrappedValue: nil)
    }
}
