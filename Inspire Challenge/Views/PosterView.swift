//
//  PosterView.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import SwiftUI

struct PosterView: View {
    @State var posterData : Posters
    var images = ["ProfileWoman", "ProfileMan", "ProfileActive"]
    var int = 1..<30
    @State var isReply : Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            HStack(alignment: .center, spacing: 10){
                Image("\(images.randomElement()!)")
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading, spacing: 2){
                    Text(posterData.author.nickname).fontWeight(.heavy)
                        .font(.custom("Avenir", size: 14))
                    Text("\(ISO8601DateFormatter().date(from: posterData.created)!.toString(dateFormatter: DateFormatter(format: "MMM dd, YYYY ' •' hh:mm a"))!)")
                        .font(.custom("Avenir", size: 12)).fontWeight(.heavy)
                        .foregroundColor(Color("Grey4"))
                }
            }
            Text("Survey Shows \(posterData.title) of Migrane Sufferers").fontWeight(.heavy)
                .font(.custom("Avenir", size: 20)).lineLimit(2)
            Text("Hello all, \(posterData.content)ing as I just joined Inspire today. My dad was diagnosed with Stage 4 pancreatic cancer end of August 2017. The cancer had spread to his liver. Life expectancy with treatment was about lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .font(.custom("Avenir", size: 14))
            
            HStack{
                if !isReply{
                    ITCardView(imageName: "CommentBlue", text: "\(int.randomElement()!) Replies")
                    Spacer()
                }
                ITCardView(imageName: "share", text: "Share")
                Spacer()
                ITCardView(imageName: "ReactIcon", text: "React")
                Spacer()
                Spacer()
                ITCardView(imageName: "Reactions", text: "\(posterData.reactions[0].count+posterData.reactions[1].count+posterData.reactions[2].count)")
            }
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color("Grey2"))
        }.foregroundColor(.black).lineSpacing(3).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
            .padding(.init(top: 20, leading: 40, bottom: 0, trailing: 40))
    }
}

struct ITCardView:View {
    @State var imageName : String
    @State var text : String
    var body: some View {
        HStack(spacing: 5){
            Image(imageName)
            Text(text)
                .font(.custom("Avenir", size: 12)).fontWeight(.heavy)
        }
    }
}
