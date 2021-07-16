//
//  Post.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/15.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}
struct Post: Codable {
    let id      : Int
    let name    : String
    let date    : String
    let avatar  : String
//    var isFollowed: Bool
    
    let text    : String
    let images  : [String]
    
    var isLiked      : Bool
    var likeCount    : Int
    var commentCount : Int
}

// 伸びる機能
extension Post {
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
    
    // Calculated property
    var commentCountText: String {
        if commentCount <= 0 { return "comment"}
        if commentCount <= 1000 {return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "like"}
        if likeCount <= 1000 {return "\(likeCount)"}
        return String(format: "%.1fk", Double(likeCount) / 1000)
    }
}

let postList = loadPostListData(fileName: "1.json")

//関数：Dataをfileから探す
func loadPostListData(fileName: String) -> PostList {
    //gurad:保証uilではない
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("Can not find \(fileName) in main bundle")//失敗
    }
    //urlを通してDataを作成
    //try? :頑張って探す、なかったらnilにする
    guard let data = try? Data(contentsOf: url)else{
        fatalError("Can not load \(url)")
    }
    //url -> Data -> json -> postList[]
    //jsonのDocumentをPostListの形に解析する
    //JSONDcoder:JSONオブジェクトからデータタイプのインスタンスをデコードするオブジェクトです。
    //self：Parametersとしてpassing時に必要
    guard let list = try? JSONDecoder().decode(PostList.self, from: data)else{
        fatalError("Can not parse post list json data")
    }
    return list
}

func loadImage(name: String) -> Image {
    //!: nilでは無い
    return Image(uiImage: UIImage(named: name)!)
}
 
