class NetworkReachabilityManager {

  enum NetworkReachabilityStatus: Equatable {
    case unknown
    case notReachable
    case reachable(ConnectionType)

    enum ConnectionType {
      case wwan
      case ethernetOnWiFi
    }
  }

  var isReachable: Bool { return isReachableOnWWAN || isReachableOnEthernetOrWiFi }
  var isReachableOnWWAN: Bool { return status == .reachable(.wwan) }
  var isReachableOnEthernetOrWiFi: Bool { status == .reachable(.ethernetOnWiFi) }

  var status: NetworkReachabilityStatus {
    return .notReachable
  }
}


var network = NetworkReachabilityManager.init()


print(network.isReachable)
