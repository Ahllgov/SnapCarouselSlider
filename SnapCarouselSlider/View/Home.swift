//
//  Home.swift
//  SnapCarouselSlider
//
//  Created by Магомед Ахильгов on 29.06.2022.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    @State var posts: [Post] = []
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 15) {
                Button {
                    
                } label: {
                    Label {
                        Text("Back")
                    } icon: {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.primary)
                }
                
                Text("My Wishes")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            SnapCarousel(index: $currentIndex, items: posts) { post in
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 80)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            for index in 1...7 {
                posts.append(Post(postImage: "movie\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
