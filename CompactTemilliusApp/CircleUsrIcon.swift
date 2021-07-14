//
//  CircleUsrIcon.swift
//  CompactTemilliusApp
//
//  Created by 藤本幹也 on 2021/07/14.
//
//  ユーザアイコンのView
//  初期アイコンとしてAsetts.xcassets中のdefaultUsrIcon.pngを指定
//  ユーザによるアイコンの変更は現段階では考慮していない
//

import SwiftUI

struct CircleUsrIcon: View {
    var body: some View {
        Image("defaultUsrIcon")
            .frame(width: 190, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
    }
}

struct CircleUsrIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircleUsrIcon()
            .scaleEffect(0.5) //Viewの表示サイズを変更
    }
}
