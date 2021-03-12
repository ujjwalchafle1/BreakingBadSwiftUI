//
//  DetailsView.swift
//  BrBd
//
//  Created by Ujjwal on 08/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
  
  @State var character:CharacterElement!
  
  var body: some View {
    
    VStack {
      CharacterImageView(imageUrl: character.img)
      Spacer()

      Text(character.name)
        .fontWeight(.bold)
        .font(.system(size: 30))
      
      HStack
      {
        Image("nickName")
          .resizable()
          .frame(width: 30, height: 30, alignment: .center)
        
        Text(character.nickname)
      }
      
      List
      {
        HStack
        {
          Text("Occupation")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
          
          Text(character.occupation[0])
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
        
        HStack
        {
          Text("Status")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
          
          Text(character.status)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
        
        HStack
        {
          Text("Breaking Bad Seasons")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
          
          Text(character.appearance.map {String($0)}.joined(separator: ", "))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
      }
    }
  }
}

struct DetailsView_Previews: PreviewProvider {
  static var previews: some View {
    DetailsView()
  }
}
