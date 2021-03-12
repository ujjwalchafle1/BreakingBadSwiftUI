//
//  ListView.swift
//  BrBd
//
//  Created by Ujjwal on 07/03/2021.
//

import SwiftUI

struct ListView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  @ObservedObject var viewModel: CharacterViewModel
  
  @State private var searchText: String = ""
  
  init(vm: CharacterViewModel = CharacterViewModel()) {
    viewModel = vm
  }
  
  var body: some View {
    
    NavigationView {
      
      VStack
      {
        if !viewModel.showAlert {
          if !viewModel.charArr.isEmpty {
            SearchBar(text: $searchText)
          }
        } else {
          Button(action: {
            self.viewModel.showAlert.toggle()
            self.viewModel.isError = (false,"")
            self.viewModel.getCharacterData()
          }, label: {
            Text("Tap to Retry!")
              .foregroundColor(.orange)
              .font(.title2)
          })
        }
        
        List {
          ForEach(viewModel.charArr.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.name) { character in
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
      
      .alert(isPresented: $viewModel.isError.0) {
        Alert(
          title: Text("Error"),
          message: Text(viewModel.isError.1)
        )
      }
      
      .onAppear{
        UITableViewCell.appearance().selectedBackgroundView = UIView()
      }
      
    }
    .accentColor(colorScheme == .dark ? .white : .black)
  }
}

