//
//  PostDetailView.swift
//  Click -> show the detail
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/18.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List {
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
            
            ForEach(1...10, id: \.self) { i in
                Text("Comment\(i)")
            }
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
