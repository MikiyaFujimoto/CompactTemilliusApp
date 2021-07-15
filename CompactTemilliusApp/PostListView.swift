//
//  PostListView.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/15.
//ß

import SwiftUI

struct PostListView: View {
    var body: some View {
//        List {
//            //id: \.id
//            ForEach(postList.list) { post in // closure
//                PostCell(post: post)
//                    //listの周りのspacerが０にする
//                    .listRowInsets(EdgeInsets())
//            }
//    }
        List(postList.list, id: \.id) { post in
            PostCell(post: post)
        }
}
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
