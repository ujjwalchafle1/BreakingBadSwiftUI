//
//  CharacterViewModel.swift
//  BreakingBadSwiftUI
//
//  Created by Ujjwal on 12/03/2021.
//

import Foundation

class CharacterViewModel: ObservableObject{
  
  @Published var charArr: Character = []
  @Published var isError    = (false,"")
  @Published var showAlert  = false

  private var service = CharacterService()
  
  init() {
    self.getCharacterData()
  }
  
  func getCharacterData()
  {
    service.delegate = self
    service.getCharacterData()
  }
  
}

extension CharacterViewModel: CharacterServiceDelegate
{
  func didReciveResponse(response: Character) {
    DispatchQueue.main.async {
      self.charArr = response
    }
  }
  
  func didReciveError(error: String) {
    // print(error)
    DispatchQueue.main.async {
      self.showAlert.toggle()
      self.isError = (true, error)
    }
  }
}
