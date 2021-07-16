//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/30/21.
//

import Foundation

public protocol Serializable {
  func toDictionary() -> [String: Any]
}
