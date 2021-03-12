//
//  ListView.swift
//  BrBd
//
//  Created by Ujjwal on 07/03/2021.
//

import SwiftUI

struct ListView: View, CharacterServiceDelegate {
  
  @Environment(\.colorScheme) var colorScheme
  
  @State private var searchText: String = ""
  
  
  func didReciveResponse(response: Character) {
    charArr = response
  }
  
  func didReciveError(error: String) {
    // print(error)
    DispatchQueue.main.async {
      self.showAlert.toggle()
      self.isError = (true, error)
    }
  }
  
  @State var charArr: Character = []
  @State var isError = (false,"")
  @State var showAlert = false
  
  var body: some View {
    
    NavigationView {
      
      VStack
      {
        if !showAlert {
          if !charArr.isEmpty {
            SearchBar(text: $searchText)
          }
        } else {
          Button(action: {
            self.showAlert.toggle()
              self.isError = (false,"")
              self.getData()
          }, label: {
            Text("Tap to Retry!")
              .foregroundColor(.orange)
              .font(.title2)
          })
        }
        
        List {
          ForEach(charArr.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.name) { character in
            NavigationLink(
              destination: DetailsView(character: character),
              label: {
                CharacterCell(charName: character.name, charNickName: character.nickname, imageUrl: character.img)
              })
              .listRowBackground(Color(.clear))
          }
          .navigationTitle("Breaking Bad")
        }
      }
      
      .alert(isPresented: $isError.0) {
        Alert(
          title: Text("Error"),
          message: Text(isError.1)
        )
      }
      
      .onAppear{
        UITableViewCell.appearance().selectedBackgroundView = UIView()
        getData()
      }
      
    }
    .accentColor(colorScheme == .dark ? .white : .black)
  }
  
  func getData()
  {
    var service = CharacterService()
    service.delegate = self
    service.getCharacterData()
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
