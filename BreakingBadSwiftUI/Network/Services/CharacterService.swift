//
//  CSViewModel.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Protocol to notify Success or Failure of the API call
protocol CharacterServiceDelegate
{
  func didReciveResponse(response: Character)
  func didReciveError(error: String)
}

/// ViewModel for handling the data required for credit score view
struct CharacterService
{
  var delegate:CharacterServiceDelegate?
  
  /// Function to make API call to get the credit score report data
  func getCharacterData()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .mockCreditValues, dictionary: nil, type: Character.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
