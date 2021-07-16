//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/28/21.
//

import Foundation

public enum AladdinError: Error {
  case loginFailed
  
  case notAuthorized(_ message: String)
  
  case unknown(_ message: String)
}
