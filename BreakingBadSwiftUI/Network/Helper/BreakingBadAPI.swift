//
//  CreditScoreAPI.swift
//  BreakingBadSwiftUI
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Use this enum to create base url and endpoint path
/// Add additional cases for future API services
enum BreakingBadAPI {
  case mockCreditValues
}

/// Create base url and path components based on the enum case.
extension BreakingBadAPI: EndpointType
{
  var baseURL: URL {
    switch self {
    case .mockCreditValues :
      return URL(string: "https://breakingbadapi.com/")!
    }
  }
  
  var path: String {
    switch self {
    case .mockCreditValues :
      return "api/characters?limit=10&offset=10"
    }
  }
  
}
