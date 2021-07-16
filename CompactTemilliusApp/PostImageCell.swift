//
//  PostImageCell.swift
//  CompactAPP
//
//  Created by songhongqiao on 2021/07/16.
//

import SwiftUI

// 変更しやすい, ここしか使わない
private let kImageSpace: CGFloat = 6

struct PostImageCell: View {
    let width : CGFloat
    let images: [String]
    
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(name: images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 0.75)// 4 : 3
                    .clipped()
            } else if images.count == 2 {
                PostImageCellRow(width: width, images: images)
            } else if images.count == 3 {
                PostImageCellRow(width: width, images: images)
            } else if images.count == 4 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(width: width, images: Array(images[0...1]))
                    PostImageCellRow(width: width, images: Array(images[2...3]))
                }
               
            } else if images.count == 5  {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(width: width, images: Array(images[0...1]))
                    PostImageCellRow(width: width, images: Array(images[2...4]))
                }
            } else if images.count == 6 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(width: width, images: Array(images[0...2]))
                    PostImageCellRow(width: width, images: Array(images[3...5]))
                }
            }
        }
    }
}

struct PostImageCellRow: View {
    let width : CGFloat
    let images: [String]
    
    //一列に乗せる写真の数
    var body: some View {
        HStack(spacing: 6) {
            ForEach(images, id: \.self) { image in // closure
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - 6 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count), height: (self.width - 6 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let  width = UIScreen.main.bounds.width
        let images = postList.list[0].images
        return Group {
            PostImageCell(width: width, images: Array(images[0...0]))
            PostImageCell(width: width, images: Array(images[0...1]))
            PostImageCell(width: width, images: Array(images[0...2]))
            PostImageCell(width: width, images: Array(images[0...3]))
            PostImageCell(width: width, images: Array(images[0...4]))
            PostImageCell(width: width, images: Array(images[0...5]))
        }
        // previewしやすい
        .previewLayout(.fixed(width: width, height: 300))
    }
}
