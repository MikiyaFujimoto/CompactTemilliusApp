//
//  RegUsrNameView.swift
//  CompactTemilliusApp
//
//  Created by 藤本幹也 on 2021/07/13.
//
//  ユーザ名登録を扱うView
//  navigationなどは未実装。変更の必要あり。
//

import SwiftUI

struct RegUsrNameView: View {
    //ここで得た情報を外部ファイルからも得ることができるようにするべき。
    @State private var usrName = ""
    
    var body: some View {
        VStack {
            //$により参照を渡している。Cのポインタと似た概念。
            TextField("ユーザ名", text: $usrName)
                .textFieldStyle(RoundedBorderTextFieldStyle()) //入力域の周りを枠で囲む
                .padding()
            Text("\(usrName) で始める。")
        }
    }
    
    //usrNameのゲッター
    func getUsrName() -> String {
        return self.usrName
    }
}


struct RegUsrNameView_Previews: PreviewProvider {
    static var previews: some View {
        RegUsrNameView()
    }
}
