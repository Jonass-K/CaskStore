//
//  SearchResult.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 05.07.22.
//

import SwiftUI

struct SearchResult: View {
    var cask: CaskSearchResult
    
    init(_ cask: CaskSearchResult) {
        self.cask = cask
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            HStack(alignment: .center, spacing: 16.0) {
                AsyncImage(url: URL(string: cask.caskIcon)) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .padding(5.0)
                         .frame(maxWidth: 50, maxHeight: 50)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.secondaryContainer)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(cask.title)
                        .font(.title2)
                    Text(cask.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button {
                    print("Download")
                } label: {
                    Text("LADEN")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                        .padding(.vertical)
                        .padding(.horizontal, 3)
                }
                .background(.white)
                .cornerRadius(50.0)
            }
            
            AsyncImage(url: URL(string: cask.caskPreviewImage)) { image in
                image.resizable()
                    .aspectRatio(16/10, contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .background(Color.secondaryContainer)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .padding(.horizontal, 10.0)
        }
        .frame(maxWidth: 500)
        .padding()
    }
}
