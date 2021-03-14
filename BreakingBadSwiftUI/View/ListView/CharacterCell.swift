//
//  CharacterCell.swift
//  BreakingBadSwiftUI
//
//  Created by Ujjwal on 07/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
  
  @State var charName     = ""
  @State var charNickName = ""
  @State var imageUrl     = ""
  
  var body: some View {
    VStack {
      CharacterImageView(imageUrl: imageUrl)
      
      HStack
      {
        VStack(alignment: .leading)
        {
          Text(charName)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .lineLimit(3)
          
          Text(charNickName.uppercased())
            .foregroundColor(.secondary)
          
        }
        .layoutPriority(100)
        
        Spacer()
      }
      .padding()
    }
    .cornerRadius(10)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray), lineWidth: 1)
    )
    .padding([.top, .horizontal])
  }
}
