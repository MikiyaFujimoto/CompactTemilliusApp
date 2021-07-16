//
//  PostCell.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/15.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                // Upload avatar
                post.avatarImage
                    .resizable()//大きさ調整できる
                    .scaledToFill()//写真をfillにする
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)//大きさ決める
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)//形を変化する
                
                VStack(alignment: .leading, spacing: 5) {
                    // Upload name
                    Text(post.name)
                        .font(Font.system(size: 16))//字体
                        .foregroundColor(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
                        .lineLimit(1)
                    
                    // Upload date
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 15)//
                
                Spacer()
                
                
                //followのbutton
                //            Button(action: {
                //                print("Click follow button")
                //            }, label: {
                //                Text("Follow")
                //                    .font(.system(size: 14))
                //                    .foregroundColor(.orange)
                //                    .frame(width: 50, height: 26)
                //view on view
                //                    .overlay(
                //                    RoundedRectangle(cornerRadius: 13)
                //周りだけ描く
                //                        .stroke(Color.orange, lineWidth: 1))
                //            })
                
            }
            
            // Upload text
            Text(post.text)
                .font(.system(size: 17))
            
            // Upload photos
            if !post.images.isEmpty {
                PostImageCell(width: UIScreen.main.bounds.width - 30, images: post.images)
            }
            
            //割り線
            Divider()
            
            //the button of comment and like 
            HStack(spacing: 0) {
                
                Spacer()
                
                PostCellToolsButton(image: "message",
                                    text: post.commentCountText,
                                    color: .black)
                {
                    print("Click comment button")
                }
                
                Spacer()
                
                PostCellToolsButton(image: "heart",
                                    text: post.likeCountText,
                                    color: .black)
                {
                    print("Click like button")
                }
                
                Spacer()
                
            }
            
            // the spacer btween photos
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        //listの一番目
        PostCell(post: postList.list[0])
    }
}
