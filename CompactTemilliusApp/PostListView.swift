//
//  PostListView.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/15.
//ß

import SwiftUI

struct PostListView: View {
    //初期化
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        //        List {
        //            //id: \.id
        //            ForEach(postList.list) { post in // closure
        //                PostCell(post: post)
        //                    //listの周りのspacerが０にする
        //                    .listRowInsets(EdgeInsets())
        //            }
        //    }
        List {
            ForEach(postList.list, id: \.id) { post in
                //垂直方向の積み重ね
                ZStack {
                    PostCell(post: post)
                    // click -> jump to the page
                    NavigationLink(
                        destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    // Hide the ">" (text)
                    .hidden()
                }
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView()
                .navigationTitle("Temillius")
                // Hide the title
                .navigationBarHidden(true)
        }
    }
}
