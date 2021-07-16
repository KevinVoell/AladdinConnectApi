import Alamofire
import Foundation
import Logging

/// The main api class for the Aladdin Connect interaction
public protocol Api {
  /// Logger reference
  var logger: Logger? { get set }
}
