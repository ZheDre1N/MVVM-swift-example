//
//  Box.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 19.02.2022.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
    }
    
    init(_ value: T) {
        self.value = value
    }
}
