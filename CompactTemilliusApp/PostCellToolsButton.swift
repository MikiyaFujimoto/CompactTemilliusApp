//
//  PostCellToolsButton.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/15.
//

import SwiftUI

struct PostCellToolsButton: View {
    let image : String
    let text  : String
    let color : Color
    let action: () -> Void// closure
    
    var body: some View {
        Button(action: action) {
            //水平
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolsButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolsButton(image: "heart", text: "Like", color: .red) {
            print("liked")
        }
    }
}
