//
//  KeychainWrapperSubscript.swift
//  SwiftKeychainWrapper
//
//  Created by Vato Kostava on 5/10/20.
//  Copyright © 2020 Jason Rendel. All rights reserved.
//

import Foundation

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public extension KeychainWrapper {
        
    func remove(forKey key: Key) {
        try? removeObject(forKey: key.rawValue)
    }
    
}

public extension KeychainWrapper {
    
    subscript(key: Key) -> String? {
        get { return string(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

    subscript(key: Key) -> Bool? {
        get { return bool(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

    subscript(key: Key) -> Int? {
        get { return integer(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

    subscript(key: Key) -> Double? {
        get { return double(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

    subscript(key: Key) -> Float? {
        get { return float(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

    #if canImport(CoreGraphics)
    subscript(key: Key) -> CGFloat? {
        get { return cgFloat(forKey: key) }
        set {
            guard let cgValue = newValue else { return }
            let value = Float(cgValue)
            try? set(value, forKey: key.rawValue)
        }
    }
    #endif
    
    subscript(key: Key) -> Data? {
        get { return data(forKey: key) }
        set {
            guard let value = newValue else { return }
            try? set(value, forKey: key.rawValue)
        }
    }

}


public extension KeychainWrapper {
    
    func data(forKey key: Key) -> Data? {
        if let value = data(forKey: key.rawValue) {
            return value
        }
        return nil
    }

    func bool(forKey key: Key) -> Bool? {
        if let value = bool(forKey: key.rawValue) {
            return value
        }
        
        return nil
    }

    func integer(forKey key: Key) -> Int? {
        if let value = integer(forKey: key.rawValue) {
            return value
        }
        
        return nil
    }

    func float(forKey key: Key) -> Float? {
        if let value = float(forKey: key.rawValue) {
            return value
        }
        
        return nil
    }

    #if canImport(CoreGraphics)
    func cgFloat(forKey key: Key) -> CGFloat? {
        if let value = float(forKey: key) {
            return CGFloat(value)
        }
        
        return nil
    }
    #endif

    func double(forKey key: Key) -> Double? {
        if let value = double(forKey: key.rawValue) {
            return value
        }
        
        return nil
    }

    func string(forKey key: Key) -> String? {
        if let value = string(forKey: key.rawValue) {
            return value
        }
        
        return nil
    }

}


public extension KeychainWrapper {
    
    struct Key: Hashable, RawRepresentable, ExpressibleByStringLiteral {

        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(stringLiteral value: String) {
            self.rawValue = value
        }
    }
    
}
