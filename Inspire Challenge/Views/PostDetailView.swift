//
//  PostDetailView.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var posterData : Posters
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "chevron.left")
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(Color("Grey3")).frame(width: 60, height: 30)
            Rectangle().frame(height:1).foregroundColor(Color("Grey1"))
            PosterView(posterData: posterData, isReply: true)
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}
