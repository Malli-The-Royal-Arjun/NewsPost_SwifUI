//
//  ContentView.swift
//  Inspire Challenge
//
//  Created by Devsoft on 11/15/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var posterViewModel = PosterViewModel()
    @State private var selection : String? = nil
    @State private var tabIndex = 0
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack{
                CustomTopTabBar(tabIndex: $tabIndex, postsCount: .constant(searchResults.count))
                    .padding(.horizontal)
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(searchResults, id: \.self){ id in
                        NavigationLink(destination: PostDetailView(posterData: id), tag: id.id, selection: $selection){
                            PosterView(posterData: id)
                                .onTapGesture {
                                    self.selection = id.id
                                }
                        }
                    }
                }
            }.searchable(text: $searchText)
        }
    }
    var searchResults: [Posters] {
        if searchText.isEmpty {
            return self.posterViewModel.posterModel
        } else {
            return self.posterViewModel.posterModel.filter { $0.author.nickname.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
