//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/19/21.
//

import Foundation

extension String {
  
  /// Converts a string to it's base64 representation
  /// - Returns: The base64 encoded string
  func toBase64() -> String {
    return Data(self.utf8).base64EncodedString()
  }
}
